class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.references :cv, null: false, foreign_key: true
      t.string :title
      t.string :name
      t.string :date
      t.text :description
      t.text :highlights
      t.string :github

      t.timestamps
    end
  end
end
