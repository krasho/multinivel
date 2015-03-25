# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  name       :string
#  state_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class City < ActiveRecord::Base
  belongs_to :state
end
