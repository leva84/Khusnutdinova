module ApplicationHelper
  def admin
    if current_user.present?
      current_user.is_admin
    else
      false
    end
  end
end
