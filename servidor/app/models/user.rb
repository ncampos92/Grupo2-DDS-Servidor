class User < ActiveRecord::Base
	has_many: :comments
	has_many: :proposals
	has_many: :likes
end
