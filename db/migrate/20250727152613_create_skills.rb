class CreateSkills < ActiveRecord::Migration[7.1]
  def change
    create_table :skills do |t|
      t.string :title
      t.references :cv, null: false, foreign_key: true
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
