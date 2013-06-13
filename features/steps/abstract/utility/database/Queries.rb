module Utility::Database::Queries

  #TODO: Abstract the ActiveRecord calls and the splitting of array results into singluar method -- pass in the unique query elements and the array indicies needed

  def user_id_from_email(email)
    #TODO: maybe this should be stored in user object when first generated and then referenced as attribute every time it is needed directly?
    a = ActiveRecord::Base.connection.execute("SELECT id FROM scidea_users WHERE email='#{email}'").each { |array| array }; a[0][0]
  end

  def is_us_from_email(email) #is the user domestic or not?
    a = ActiveRecord::Base.connection.execute("SELECT is_us FROM scidea_users WHERE email='#{email}'").each { |array| array }; a[0][0]
  end

  def role_id_from_user_id(user_id)
    a = ActiveRecord::Base.connection.execute("SELECT role_id FROM scidea_role_users WHERE user_id=#{user_id}").each { |array| array }; a[0][0]
  end

  def role_name_from_role_id(role_id)
    a = ActiveRecord::Base.connection.execute("SELECT name FROM scidea_roles WHERE id=#{role_id}").each { |array| array }; a[0][0]
  end
end

