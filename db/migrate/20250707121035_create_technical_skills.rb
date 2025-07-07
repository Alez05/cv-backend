class CreateTechnicalSkills < ActiveRecord::Migration[7.1]
  def change
    create_table :technical_skills do |t|
      t.string :languages
      t.string :frameworks
      t.string :tools
      t.references :cv, null: false, foreign_key: true

      t.timestamps
    end
  end
end
