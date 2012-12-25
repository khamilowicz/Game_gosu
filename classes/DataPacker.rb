require "json"


class DataPacker

  attr_reader :available
  def initialize
    @data = {}
  end

  def add_data obj
    if obj.is_a? Class
      obj.all.each do |ins|
        self.add_data ins
      end
    else
      o_class = obj.class
      if @data[o_class].nil?
        @data[o_class] = [obj.data]
      else
        temp = @data[o_class]
        temp << obj.data
        @data[o_class] = temp
      end
    end
  end

  def data 
    @data
  end

  def flush_data_to_json
    data = @data 
    @data = {}
    data.to_json
  end

  def flush_data
    data = @data 
    @data = {}
    data
  end

  def available?
    @available 
  end

  def unpack_data data
    @available = true
    begin
      @data = JSON.load(data)
    rescue
      @available = false
    end
  end

  def to_s
    ret = ""
    @data.each do |key, value|
      ret += "Object type: #{key}\n"

      value.each do |obj|
        obj.each do |k,v|
          ret += "\t #{k}:\t #{v}\n"
        end
        ret+= "\n"
      end
    end
    ret
  end
end	
