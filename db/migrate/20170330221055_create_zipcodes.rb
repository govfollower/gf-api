class CreateZipcodes < ActiveRecord::Migration
  def change
    create_table :zipcodes do |t|
      t.belongs_to :district, index: true

      t.string :zipcode_value

      t.timestamps null: false
    end
  end
end
