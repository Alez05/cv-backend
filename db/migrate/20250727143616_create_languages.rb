class CreateLanguages < ActiveRecord::Migration[7.1]
  def change
    create_table :languages do |t|
      t.string :title
      t.string :language
      t.string :level
      t.references :cv, null: false, foreign_key: true

      t.timestamps
    end
  end
end
