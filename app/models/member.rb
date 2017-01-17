class Member < ApplicationRecord
  include EnumTranslation
  enum level:[:member_junior,:member_middle,:member_advanced]
  enum sex:[:female,:male]
  has_many :member_details
end
