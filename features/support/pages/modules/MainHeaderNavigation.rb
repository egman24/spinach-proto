module MainHeaderNavigation
  include PageObject

  ############################
  ## Page Element Inventory ##
  ############################

  link(:logo_link,    :text => 'OnlineAHA.org', :href => "/")

  ## Account Navigation ##
  link(:main_nav_account,                        :class => 'dropdown-toggle',          :href => '#')
  link(:sub_nav_account_credits_and_transcripts, :text => 'Credits &amp; Transcripts', :href => '/certificates')
  link(:sub_nav_account_edit_profile,            :text => 'Edit My Profile')#,         :href => '/users/1/edit')
  link(:sub_nav_account_admin,                   :text => 'Admin',                     :href => '/admin')
  link(:sub_nav_account_logout,                  :text => 'Logout',                    :href => '/users/sign_out')

  ## Main Navigation ##


  ###########################
  ## Page Action Inventory ##
  ###########################

  def open_account_navigation
    main_nav_account
  end

  def navigate_to_admin_interface
    sub_nav_account_admin
  end

end