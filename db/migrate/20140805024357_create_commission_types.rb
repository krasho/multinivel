class CreateCommissionTypes < ActiveRecord::Migration
  def change
    create_table :commission_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
