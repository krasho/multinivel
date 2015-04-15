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

class Associate < ActiveRecord::Base
  attr_accessor :username
  attr_accessor :password

  has_many :associates, class_name: 'Associate', foreign_key: 'supervisor_id'
  belongs_to :supervisor, class_name: 'Associate'
  belongs_to :city

  has_one    :user
  accepts_nested_attributes_for :user

  before_save { self.email = email.downcase }
  

  validates :name, presence:  true, length: { maximum: 100 }
  validates :phone, presence: true
  validates :email, presence: true

  validates :supervisor_id, numericality: { only_integer: true }
  validates :supervisor_id, presence: true

  validates :city_id, numericality: {only_integer: true}
  validates :city_id, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false } 


end
