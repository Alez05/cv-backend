class CreateExperiences < ActiveRecord::Migration[7.1]
  def change
    create_table :experiences do |t|
      t.references :cv, null: false, foreign_key: true
      t.string :name
      t.string :location
      t.date :date
      t.text :details
      t.string :title

      t.timestamps
    end
  end
end
