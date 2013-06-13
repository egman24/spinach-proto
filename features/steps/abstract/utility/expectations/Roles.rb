module Utility::Expectations::Roles
  include Utility::Database::Queries

  def user_is_learner_role(email)
    expect(user_role(email)).to eql("Learner")
  end

  def user_role(email)
    id      = user_id_from_email(email)
    role_id = role_id_from_user_id(id)
    role_name_from_role_id(role_id)
  end
end