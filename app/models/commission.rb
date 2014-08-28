# == Schema Information
#
# Table name: commissions
#
#  id                     :integer          not null, primary key
#  purchase_amount        :decimal(, )
#  calculation_start_date :date
#  calculation_end_date   :date
#  amount                 :decimal(, )
#  type_id                :integer
#  payed                  :boolean
#  created_at             :datetime
#  updated_at             :datetime
#

class Commission < ActiveRecord::Base
  belongs_to :type
end
