module Utility::Dependencies::Users
  def create_new_domestic_guest_user
    @user = User.new(:type => :on_the_fly, :country => :domestic)
  end

  def create_new_international_guest_user
    @user = User.new(:type => :on_the_fly, :country => :international)
  end
end