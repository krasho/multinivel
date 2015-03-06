# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  rfc        :string(255)
#  address    :string(255)
#  telephone  :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Company < ActiveRecord::Base
end
