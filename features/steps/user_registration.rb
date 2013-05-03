class Spinach::Features::UserRegistration < Spinach::FeatureSteps

  require_relative 'abstract/utility'
  include Utility::Navigation
  include Utility::Users

  ###########
  ## Given ##
  ###########

  step 'I am a domestic guest user' do
    create_new_domestic_guest_user
  end

  step 'I navigate to onlineAHA' do
    open_browser_and_navigate_to_site
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
    pending 'step not implemented'
  end

  ##########
  ## Then ##
  ##########

  step 'I should see that I am logged in' do
    pending 'step not implemented'
  end

  step 'I should be on the "/courses" page' do
    pending 'step not implemented'
  end

  step 'I should be greeted with a flash message' do
    pending 'step not implemented'
  end

  step 'My account should be learner type' do
    pending 'step not implemented'
  end

  step 'I should have a domestic profile' do
    pending 'step not implemented'
  end

  step 'I should have received a welcome email' do
    pending 'step not implemented'
  end

  step 'I am an international guest user' do
    pending 'step not implemented'
  end

  step 'I should have an international profile' do
    pending 'step not implemented'
  end
end
