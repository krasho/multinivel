# == Schema Information
#
# Table name: supervisor_commissions
#
#  id                   :integer          not null, primary key
#  total                :float
#  start_date_comission :date
#  end_date_comission   :date
#  comission            :float
#  paid                 :boolean
#  supervisor_id        :integer
#  supervisor           :string
#  created_at           :datetime
#  updated_at           :datetime
#

require 'test_helper'

class SupervisorCommissionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
