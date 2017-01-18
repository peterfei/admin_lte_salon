class MemberDetail < ApplicationRecord
  belongs_to :member
  before_save :total_price_before_save

  private
  def total_price_before_save
    self.createtime = Time.now.to_i
    if self.re_pay.present?
      self.cumulative =  self.member.blance+self.re_pay
      self.per_pay = 0.00
    else
      self.cumulative =  self.member.blance-self.per_pay
      self.re_pay = 0.00
    end

    self.operate_id = 1
    self.member.update_attribute(:blance,self.cumulative)
  end
end
