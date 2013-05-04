class Spinach::Features::UserRegistration < Spinach::FeatureSteps

  require_relative 'abstract/utility'
  include Utility::Navigation
  include Utility::Users
  include Utility::Expectations::Locations
  include Utility::Expectations::Messages

  ###########
  ## Given ##
  ###########

  step 'I am a domestic guest user' do
    create_new_domestic_guest_user #Utility::Users
  end

  step 'I am an international guest user' do
    create_new_international_guest_user #Utility::Users
  end

  step 'I navigate to onlineAHA' do
    open_browser_and_navigate_to_site #Utility::Navigation
  end

  ##########
  ## When ##
  ##########

  step 'I click to Sign Up on the Home Page' do
    visit HomePage do |page|
      #$screen.snapshot
      page.click_to_sign_up
      #$screen.snapshot
    end
  end

  step 'I fill out the registration form' do
    on RegistrationPage do |page|
      #$screen.snapshot
      page.enter_sign_up_values(:country               => @user.country,
                                :email                 => @user.email,
                                :email_confirmation    => @user.email,
                                :password              => @user.password,
                                :password_confirmation => @user.password,
                                :first_name            => @user.first_name,
                                :last_name             => @user.last_name)
      #$screen.snapshot
      page.sign_up
      #$screen.snapshot
    end
  end

  ##########
  ## Then ##
  ##########

  step 'I should see that I am logged in' do
    pending 'step not implemented'
  end

  step 'I should be on the My Courses page' do
    pending on_my_courses_page #Utility::Expectations::Locations
  end

  step 'I should be greeted with a flash message' do
    flash_message(:notice, "You have signed up successfully.") #Utility::Expectations::Messages
  end

  step 'My account should be learner type' do
    pending 'Should this be seperate test? if so how can i reference that this is part of the registration cascade'
  end

  step 'I should have a domestic profile' do
    pending 'Should this be seperate test? if so how can i reference that this is part of the registration cascade'
  end

  step 'I should have an international profile' do
    pending 'Should this be seperate test? if so how can i reference that this is part of the registration cascade'
  end

  step 'I should have received a welcome email' do
    pending 'Should this be seperate test? if so how can i reference that this is part of the registration cascade'
  end
end
