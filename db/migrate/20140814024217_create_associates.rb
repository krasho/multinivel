class CreateAssociates < ActiveRecord::Migration
  def change
    create_table :associates do |t|
      t.string :name
      t.date :admission_date
      t.string :phone
      t.string :address
      t.string :zip_code
      t.string :email
      t.string :account_number
      t.string :clabe
      t.boolean :is_supervisor
      t.references :supervisor, index: true
      t.references :city, index: true
      t.references :bank, index: true

      t.timestamps
    end
  end
end
