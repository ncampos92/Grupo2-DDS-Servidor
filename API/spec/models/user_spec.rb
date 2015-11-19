require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates" do
  	@user = User.new
  	@user.first_name = "Test"
  	@user.last_name = "tester"
  	@user.email = "test@testing.com"
  	@user.password = "passwordtest123"
  	@user.save
  	@user2 = User.find_by_email("test@testing.com")
  	@user2.should  !be_null
  end
end
