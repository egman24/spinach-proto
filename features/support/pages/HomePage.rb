class HomePage
  include PageObject

  #########################
  ## Setup page identity ##
  #########################

  page_url( @@url = "#{$WEBSITE}/" )

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

  text_field(:email,             :id => 'user_email')
  text_field(:password,          :id => 'user_password')
      button(:submit_sign_in, :value => 'Sign In')
        link(:click_sign_up,   :text => 'Sign Up', :href => "#{$WEBSITE}/users/sign_up")

  ###########################
  ## Page Action Inventory ##
  ###########################

  def enter_sign_in_values(args={})
    self.email    = args[:email]
    self.password = args[:password]
  end

  def sign_in
    submit_sign_in
  end

  def click_to_sign_up
    click_sign_up
  end

  def sign_in_as_admin

  end

end