module Utility::Expectations::Locations
  def on_my_courses_page
    $screen.snapshot
    expect(@browser.url).to eq(MyCoursesPage.url)
  end
end