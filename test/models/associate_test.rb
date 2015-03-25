# == Schema Information
#
# Table name: associates
#
#  id             :integer          not null, primary key
#  name           :string
#  admission_date :date
#  phone          :string
#  address        :string
#  zip_code       :string
#  email          :string
#  account_number :string
#  clabe          :string
#  is_supervisor  :boolean
#  supervisor_id  :integer
#  city_id        :integer
#  bank_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#

require 'test_helper'

class AssociateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
