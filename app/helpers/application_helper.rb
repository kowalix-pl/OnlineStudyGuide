module ApplicationHelper
  def current_user_role
    current_user.lecturer ? "lecturer" : "student"
  end 
end
