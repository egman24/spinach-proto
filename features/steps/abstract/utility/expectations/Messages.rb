module Utility::Expectations::Messages

  def flash_type(type)
    case type
      when :notice #blue
        "icon-notice"
      when :error #red
        "icon-error"
      else
        nil
    end
  end

  def flash_message(message_type, message_text)
    $screen.snapshot
    expect(@browser.span( :class => flash_type(message_type) ).exists?).to be_true and
        expect(@browser.text.include? message_text).to be_true
  end

end