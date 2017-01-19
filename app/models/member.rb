class Member < ApplicationRecord
  include EnumTranslation
  enum level:[:member_junior,:member_middle,:member_advanced]
  enum sex:[:female,:male]
  has_many :member_details
  validates :name,:presence=>{:message=>'会员名称不能为空'}
  validates :sex,:presence=>{:message=>'性别不能为空'}
  validates :level,:presence=>{:message=>'会员级别不能为空'}
  validates :cid,:presence=>{:message=>'卡号不能为空'},
            :uniqueness =>{:message=>'卡号已存在'}
  validates :phone,:presence=>{:message=>'电话号码不能为空'},
            :uniqueness =>{:message=>'电话号码已存在'}
  default_scope  {order("id desc")}
end
