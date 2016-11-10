module AdminHelper
  # Logs in the given seller.
  def admin_log_in(admin)
    session[:admin_id] = admin.id
  end

  def admin_logged_in?
  	!session[:admin_id].nil?
  end

  def admin_log_out
  	session.delete(:admin_id)
  end
end
