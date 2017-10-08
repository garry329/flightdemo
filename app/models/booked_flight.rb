class BookedFlight < ActiveRecord::Base
  belongs_to :flight
end
