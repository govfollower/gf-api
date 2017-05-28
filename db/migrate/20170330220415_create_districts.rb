class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.belongs_to :state, index: true

      t.integer :district_number

      t.timestamps null: false
    end
  end
end
