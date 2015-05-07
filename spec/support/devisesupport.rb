include Warden::Test::Helpers

# Module for authenticating users for request specs.
module ValidUserRequestHelper
  # Signs in a valid user uwing the page.drive.post method
  def sign_in_as_valid_user_driver
       @user ||= FactoryGirl.create :user
       login_as user, scope :user
       user 
      #page.driver.post user_session_path, :user => {:email => @user.email, :password => @user.password}
  end
end


RSpec.configure do |config|
  config.include ValidUserRequestHelper, type: :feature
end