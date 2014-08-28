# == Schema Information
#
# Table name: commission_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class CommissionType < ActiveRecord::Base
end
