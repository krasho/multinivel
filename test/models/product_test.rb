# == Schema Information
#
# Table name: products
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  price                 :float
#  description           :text
#  purchase_min_quantity :integer
#  created_at            :datetime
#  updated_at            :datetime
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
