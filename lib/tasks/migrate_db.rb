path =  File.join(Rails.root, "config", "database.yml")
DB_CONFIG = YAML.load(File.new(path))
class FromDB < ActiveRecord::Base
  self.record_timestamps = false
  self.abstract_class = true
  establish_connection(DB_CONFIG['from'])
end
class ToDB < ActiveRecord::Base
  self.record_timestamps = false
  self.abstract_class = true
  establish_connection(DB_CONFIG['development'])

  def self.save_from(obj)
    n = self.find_by_id(obj.id) || self.new
    self.column_names.each do |c|
      m = "convert_#{c}"
      if obj.respond_to?(m)
        n.send("#{c}=", obj.send(m))
      else
        n.send("#{c}=", obj.send(c)) if obj.respond_to?(c)
      end
    end
    n.save
    n
  end
end