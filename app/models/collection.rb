class Collection < ActiveRecord::Base
  attr_accessible :name, :portfolio_id, :user_id
end
