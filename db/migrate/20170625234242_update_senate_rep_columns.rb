class UpdateSenateRepColumns < ActiveRecord::Migration
  def change
    remove_column :senate_reps, :first_elected_date, :date
    add_column :senate_reps, :began_office_at, :date
    add_column :senate_reps, :ended_office_at, :date
    add_column :senate_reps, :reelection_date, :date
  end
end
