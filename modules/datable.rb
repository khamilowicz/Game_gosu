module Datable
  module Instance

    def data
      s_id = id
      s_id = 2 if self.master? 
      { 'id' => s_id, 'angle' => angle, 'x' => x, 'y' => y}
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

				p class_data.keys if c_name == 'Photon'

        class_data.each do |ins_data|
          curr_id = ins_data['id']
					p curr_id
          curr_obj = self.find_by_id curr_id

          if curr_obj.nil?
            self.new self.get_default_window, ins_data['x'], ins_data['y'], ins_data['angle']
            p 'creation'
          else
            curr_obj.data = ins_data
          end
        end
      rescue
      end
    end
  end
end
