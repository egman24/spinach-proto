class MyCoursesPage
  include PageObject

  page_url( @@url = "#{$WEBSITE}/my_courses" )

  def self.url
    @@url
  end

############################
## Page Element Inventory ##
############################

end