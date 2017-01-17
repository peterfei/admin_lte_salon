class Member < ApplicationRecord
  include EnumTranslation
  enum level:[:member_junior,:member_middle,:member_advanced]
end
