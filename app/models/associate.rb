class Associate < ActiveRecord::Base
  has_many :associates, class_name: 'Associate', foreign_key: 'supervisor_id'
  belongs_to :supervisor, class_name: 'Associate'
end
