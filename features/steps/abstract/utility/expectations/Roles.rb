module Utility::Expectations::Roles

  def user_is_learner_role(email)
    expect(user_role(email)).to eql("Learner")
  end


  #TODO: Move all of this deeper logic into database results module, and include it in the utility modules that need it
  #TODO: Abstract the ActiveRecord calls and the splitting of array results into singluar method -- pass in the unique query elements and the array indicies needed

  def user_role(email)
    id      = user_id_from_email(email)
    role_id = role_id_from_user_id(id)
    role_name_from_role_id(role_id)
  end

  def user_id_from_email(email)
    a = ActiveRecord::Base.connection.execute("SELECT id FROM scidea_users WHERE email='#{email}'").each { |array| array }
    a[0][0]
  end

  def role_id_from_user_id(user_id)
    a = ActiveRecord::Base.connection.execute("SELECT role_id FROM scidea_role_users WHERE user_id=#{user_id}").each { |array| array }
    a[0][0]
  end

  def role_name_from_role_id(role_id)
    a = ActiveRecord::Base.connection.execute("SELECT name FROM scidea_roles WHERE id=#{role_id}").each { |array| array }
    a[0][0]
  end

end