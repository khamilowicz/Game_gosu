module Datable
  module Instance
    def data
      {'id' => id, 'vel' => vel, 'angle' => angle, 'x' => x, 'y' => y, 'z' => z}
    end

    def data= m_data

      @vel = m_data['vel']
      @angle = m_data['angle']
      @id = m_data['id']

      @x = m_data['x']
      @y = m_data['y']
      @z = m_data['z']
    end
  end

  module Classable
    def read_data_for_all t_all_data
      c_name = self.name

      unless t_all_data[c_name].nil?
        class_data = t_all_data[c_name]

        class_data.each do |ins_data|
          curr_id = ins_data['id']
          curr_obj = self.find_by_id curr_id
          if curr_obj.nil?
            self.new DefaultWindow
            curr_obj = self.find_by_id curr_id
          end
          curr_obj.data = ins_data
        end
      end
    end
  end
end
