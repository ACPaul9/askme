module FlashHelper
  def flash_message(flash)
    if flash[:notice].present?
      content_tag(:p, flash[:notice], class: 'mb mt message message-notice')
    elsif flash[:alert].present?
      content_tag(:p, flash[:alert], class: 'mb mt message message-alert')
    end
  end
end