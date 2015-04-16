# == Schema Information
#
# Table name: commission_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#

class CommissionType < ActiveRecord::Base
end
