class Spinach::Features::UserRegistration < Spinach::FeatureSteps

  step 'I am a domestic guest user' do
    @user = User.new(:type => :on_the_fly, :country => :domestic)
  end

  step 'I navigate to onlineAHA' do
    @browser = $browser
  end

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
