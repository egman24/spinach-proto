module Utility
  module Navigation
    def open_browser_and_navigate_to_site
      #$screen.snapshot
      @browser = $browser
      #$screen.snapshot
    end
  end

  module Users
    def create_new_domestic_guest_user
      @user = User.new(:type => :on_the_fly, :country => :domestic)
    end
  end
end
