# == Schema Information
#
# Table name: banks
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#

class Bank < ActiveRecord::Base
end
