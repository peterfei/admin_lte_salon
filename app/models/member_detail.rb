class MemberDetail < ApplicationRecord
  belongs_to :member
  before_save :total_price_before_save

  private
  def total_price_before_save
    self.createtime = Time.now.to_i
    self.cumulative =  self.member.blance-self.per_pay
    self.operate_id = 1
    self.member.update_attribute(:blance,self.cumulative)
  end
end
