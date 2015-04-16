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

class SupervisorCommission < ActiveRecord::Base
  belongs_to :supervisor
end
