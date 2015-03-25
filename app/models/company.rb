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

class Company < ActiveRecord::Base
end
