# == Schema Information
#
# Table name: products
#
#  id                    :integer          not null, primary key
#  name                  :string
#  price                 :float
#  description           :text
#  purchase_min_quantity :integer
#  created_at            :datetime
#  updated_at            :datetime
#

class Product < ActiveRecord::Base
end
