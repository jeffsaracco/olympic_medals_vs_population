class Medal < ActiveRecord::Base
  attr_accessible :bronze, :country, :gold, :silver, :total
end
