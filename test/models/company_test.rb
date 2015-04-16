# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string
#  rfc        :string
#  address    :string
#  telephone  :string
#  email      :string
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
