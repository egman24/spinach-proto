module Utility

  module Navigation
    def open_browser_and_navigate_to_site
      #$screen.snapshot
      @browser = $browser #passes the global browser created in hooks to the local pageobjects
      #$screen.snapshot
    end
  end

  module Users
    def create_new_domestic_guest_user
      @user = User.new(:type => :on_the_fly, :country => :domestic)
    end

    def create_new_international_guest_user
      @user = User.new(:type => :on_the_fly, :country => :international)
    end
  end

  module Expectations

    module Locations
      def on_my_courses_page
        #$screen.snapshot
        expect(@browser.url).to eq(MyCoursesPage.url)
      end
    end

    module Messages
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
        #$screen.snapshot
        expect(@browser.span( :class => flash_type(message_type) ).exists?).to be_true and
        expect(@browser.text.include? message_text).to be_true
      end
    end

  end

end
