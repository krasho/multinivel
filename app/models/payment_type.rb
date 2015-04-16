# == Schema Information
#
# Table name: payment_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#

class PaymentType < ActiveRecord::Base
end
