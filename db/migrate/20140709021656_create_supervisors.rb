class CreateSupervisors < ActiveRecord::Migration
  def change
    create_table :supervisors do |t|
      t.string :name
      t.date :entry_date

      t.timestamps
    end
  end
end
