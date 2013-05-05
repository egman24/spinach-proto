class MyCoursesPage
  include PageObject

  #########################
  ## Setup page identity ##
  #########################

  page_url( @@url = "#{$WEBSITE}/my_courses" )

  def self.url
    @@url
  end

  #############################
  ## Add in modular elements ##
  #############################

  require_relative 'modules/MainHeaderNavigation'

  ############################
  ## Page Element Inventory ##
  ############################

  ###########################
  ## Page Action Inventory ##
  ###########################

end