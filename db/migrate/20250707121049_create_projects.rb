class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :subtitle
      t.string :status
      t.string :date
      t.text :description
      t.text :highlights
      t.string :github
      t.references :cv, null: false, foreign_key: true

      t.timestamps
    end
  end
end
