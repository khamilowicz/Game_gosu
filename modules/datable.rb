module Datable
  module Instance

    def data
      ret = {}
      data_to_send.each do |d|
        ret[d] = send d
      end
      ret['id'] = 2 if self.master?
      ret
    end

    def data= m_data
      unless m_data.nil?
        m_data.each do |attr, value|
          send "#{attr}=", value
        end
      end
    end
  end

  module Classable
    def read_data_for_all t_all_data
      begin
        c_name = self.name

        class_data = t_all_data[c_name]

        class_data.each do |ins_data|
          curr_id = ins_data['id']
          curr_obj = self.find_by_id curr_id

          if curr_obj.nil?
            self.new self.get_default_window, ins_data['x'], ins_data['y'], ins_data['angle']
            #DEBUGGING
            p 'created'
            p ins_data
          else
            curr_obj.data = ins_data
          end
        end
      rescue
      end
    end
  end
end
