class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.date :creation_date
      t.string :rfc
      t.string :address
      t.string :telephone
      t.string :email

      t.timestamps
    end
  end
end
