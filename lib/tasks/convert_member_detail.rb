require File.join(Rails.root, "lib",'tasks', "migrate_db.rb")

class FromMemberDetail < FromDB
  self.table_name = 'app2_member_detail'
  #以前的公司id叫client_id，现在叫company_id
  # def convert_company_id
  #   self.client_id
  # end
  # #以前的status是integer，现在是boolean
  # def convert_status
  #   self.status == 0 ? false : true
  # end

  def convert_member_id
    self.mid
  end

  def convert_per_pay
    self.pay
  end


end


class ToMemberDetail < ToDB
  self.table_name = 'member_details'
  after_initialize :init

  def init
    self.operate_id ||= 1
    self.created_at ||=  Time.now
    self.updated_at ||=  Time.now
  end

end

FromMemberDetail.find_each do |src|
  ToMemberDetail.save_from(src)
end