class CreateTechnicalSkills < ActiveRecord::Migration[7.1]
  def change
    create_table :technical_skills do |t|
      t.text :languages
      t.text :frameworks
      t.text :tools
      t.text :soft
      t.references :cv, null: false, foreign_key: true

      t.timestamps
    end
  end
end
