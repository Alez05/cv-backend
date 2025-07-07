class CreateExperiences < ActiveRecord::Migration[7.1]
  def change
    create_table :experiences do |t|
      t.string :role
      t.string :company
      t.string :job_type
      t.string :location
      t.string :date
      t.text :responsibilities
      t.references :cv, null: false, foreign_key: true

      t.timestamps
    end
  end
end
