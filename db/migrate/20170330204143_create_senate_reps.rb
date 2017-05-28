class CreateSenateReps < ActiveRecord::Migration
  def change
    create_table :senate_reps do |t|
      t.belongs_to :state, index: true

      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :party
      t.date :first_elected_date
      t.date :term_start_date
      t.date :term_end_date
      t.integer :terms_served
      t.date :dob
      t.string :gender

      t.timestamps null: false
    end
  end
end
