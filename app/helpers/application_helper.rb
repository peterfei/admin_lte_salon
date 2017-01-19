module ApplicationHelper
   def count_member
     Member.all.count
   end
end
