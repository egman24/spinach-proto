module Utility::Navigation
  def open_browser_and_navigate_to_site
    $screen.snapshot
    @browser = $browser #passes the global browser created in hooks to the local pageobjects
    binding.pry
    $screen.snapshot
  end
end