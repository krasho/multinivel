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

require 'test_helper'

class CommissionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
