module SellerHelper

  # Logs in the given seller.
  def seller_log_in(seller)
    session[:seller_id] = seller.id
  end

  def seller_logged_in?
  	!session[:seller_id].nil?
  end

  def seller_log_out
  	session.delete(:seller_id)
  end

end
