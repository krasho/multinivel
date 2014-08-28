# == Schema Information
#
# Table name: associates
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  admission_date :date
#  phone          :string(255)
#  address        :string(255)
#  zip_code       :string(255)
#  email          :string(255)
#  account_number :string(255)
#  clabe          :string(255)
#  is_supervisor  :boolean
#  supervisor_id  :integer
#  city_id        :integer
#  bank_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Associate < ActiveRecord::Base
  has_many :associates, class_name: 'Associate', foreign_key: 'supervisor_id'
  belongs_to :supervisor, class_name: 'Associate'
  belongs_to :city
  belongs_to :bank
end
