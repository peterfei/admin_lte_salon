# File.join(Rails.root, "config", "database.yml")
require File.join(Rails.root, "lib",'tasks', "migrate_db.rb")

class FromDirectShipPrice < FromDB
  self.table_name = 'app2_member'
  #以前的公司id叫client_id，现在叫company_id
  # def convert_company_id
  #   self.client_id
  # end
  # #以前的status是integer，现在是boolean
  # def convert_status
  #   self.status == 0 ? false : true
  # end

  # 店庆卡|MEMER_JUNIOR   会员充值卡|MEMER_ADVANCED  金卡|MEMER_MIDDLE
  def convert_level
    case self.level
      when 'MEMER_JUNIOR'
        0
      when 'MEMER_ADVANCED'
        2
      else
        1

    end
  end
end


class ToDirectShipPrice < ToDB
  self.table_name = 'members'
  after_initialize :init

  def init

    self.created_at ||=  Time.now
    self.updated_at ||=  Time.now
  end

end

FromDirectShipPrice.find_each do |src|
  ToDirectShipPrice.save_from(src)
end