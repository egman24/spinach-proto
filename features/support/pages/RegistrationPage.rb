class RegistrationPage
  include PageObject

  #########################
  ## Setup page identity ##
  #########################

  page_url( @@url = "#{$WEBSITE}/users/sign_up" )

  def self.url
    @@url
  end

  #############################
  ## Add in modular elements ##
  #############################

  require_relative 'modules/MainHeaderNavigation'
  include MainHeaderNavigation

  ############################
  ## Page Element Inventory ##
  ############################

       button(:click_to_register,            :value => 'Register', :name => "commit"   )
     checkbox(:accept_terms_and_conditions,  :value => 'Terms'                         )
  select_list(:select_country,                  :id => 'user_scidea_profile_country_id')
   text_field(:enter_email,                     :id => 'user_email'                    )
   text_field(:enter_email_confirmation,        :id => 'user_email_confirmation'       )
   text_field(:enter_first_name,                :id => 'user_scidea_profile_first_name')
   text_field(:enter_last_name,                 :id => 'user_scidea_profile_last_name' )
   text_field(:enter_password,                  :id => 'user_password'                 )
   text_field(:enter_password_confirmation,     :id => 'user_password_confirmation'    )

  ###########################
  ## Page Action Inventory ##
  ###########################

  def enter_sign_up_values(args={})
    self.select_country              = args[:country]
    self.enter_email                 = args[:email]
    self.enter_email_confirmation    = args[:email_confirmation]
    self.enter_password              = args[:password]
    self.enter_password_confirmation = args[:password_confirmation]
    self.enter_first_name            = args[:first_name]
    self.enter_last_name             = args[:last_name]
    self.check_accept_terms_and_conditions
  end

  def sign_up
    click_to_register
  end

end