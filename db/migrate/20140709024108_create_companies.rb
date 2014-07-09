class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :nombre
      t.date :fecha_ingreso
      t.string :rfc
      t.string :direccion
      t.string :telefono
      t.string :email

      t.timestamps
    end
  end
end
