class CreateSpokenLanguages < ActiveRecord::Migration[7.1]
  def change
    create_table :spoken_languages do |t|
      t.string :language
      t.string :level
      t.references :cv, null: false, foreign_key: true

      t.timestamps
    end
  end
end
