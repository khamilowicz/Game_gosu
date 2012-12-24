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
      unless t_all_data.nil? || t_all_data[self.class].nil?
        class_data = t_all_data[self.class]
        class_data.each do |ins_data|
          if not self.all_h[ins_data['id']].nil?
            self.all_h[ins_data['id']].data = ins_data
          else

            self.all_h[ins_data['id']] = self.new
            self.all_h[ins_data['id']].data = ins_data
          end
        end
      end
    end
  end
end
