class CreateEducations < ActiveRecord::Migration[7.1]
  def change
    create_table :educations do |t|
      t.string :title
      t.string :name
      t.string :location
      t.string :date
      t.text :details
      t.references :cv, null: false, foreign_key: true

      t.timestamps
    end
  end
end
