class Member < ApplicationRecord
  enum level:[:member_junior,:member_middle,:member_advanced]
end
