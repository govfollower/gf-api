class UpdateHouseRepColumns < ActiveRecord::Migration
  def change
    remove_column :house_reps, :first_elected_date, :date
    add_column :house_reps, :began_office_at, :date
    add_column :house_reps, :ended_office_at, :date
    add_column :house_reps, :reelection_date, :date
  end
end
