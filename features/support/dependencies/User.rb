class User

  # TODO How do I represent the difference between a 'registered' user and a 'guest' user in my object space, will i need factories for registered?
  # TODO Use inheritance to make user ROLES and TYPES (sa, cm, author,...) etc... on the fly populate them in the db with populator or factory girl
  # TODO Is there a DRYer way to instantiate domestic/intl users than passing the proper array in as an initialize parameter? (each time i create user i have to remember to select correct list)

  attr_reader :birthdate, :country, :country_locale, :email, :first_name, :language_locale, :last_name, :password, :salutation

  def initialize(attributes={})
    if    attributes[:type] == :on_the_fly
      on_the_fly(attributes)
    elsif attributes[:type] == :from_database
      from_database(attributes)
    end
  end

  private

  def on_the_fly(attributes)
    if attributes[:country] == :domestic
      @country        = ApplicationConfig::COUNTRIES_DOMESTIC.sample
      @country_locale = :domestic
    elsif attributes[:country] == :international
      @country        = ApplicationConfig::COUNTRIES_INTERNATIONAL.sample
      @country_locale = :international
    else
      @country        = ApplicationConfig::COUNTRIES_ALL.sample
      @country_locale = :domestic # TODO: this is incorrect, it needs to be 'intellegent' and pick locale based on country selection, make lookup hash for all countries?
    end

    @birthdate    = attributes[:birthdate]    || Time.at(0.0 + rand * (Time.now.to_f - 0.0.to_f)).to_date
    @email        = attributes[:email]        || Faker::Internet.email #at some point faker may fail duplicates in db?)
    @first_name   = attributes[:first_name]   || Faker::Name.first_name
    @last_name    = attributes[:last_name]    || Faker::Name.last_name
    @password     = attributes[:password]     || "password"
    @salutation   = attributes[:salutation]   || ApplicationConfig::SALUTATIONS.sample
  end

  #TODO: add different user types by OOP or selection -- they can be chosen during the step definitions and then passed into the pages to do work
  # example -- user_factory, user_mock/stub; i can create any type of user I want on the fly to suit the test situation i need it for

  def from_database(attributes)

  end

end