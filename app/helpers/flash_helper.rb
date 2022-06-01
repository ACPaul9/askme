module FlashHelper
  def flash_helper_notice
    flash[:notice].present?
  end

  def flash_helper_alert
    flash[:alert].present?
  end
end