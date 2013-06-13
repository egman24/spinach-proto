module Utility::Expectations::Locales
  include Utility::Database::Queries

  def user_has_domestic_profile(email)
    expect(is_us_from_email(email)).to eq(1)
  end

  def user_has_international_profile(email)
    expect(is_us_from_email(email)).to eq(0)
  end
end