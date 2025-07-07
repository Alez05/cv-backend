class CreateEducationItems < ActiveRecord::Migration[7.1]
  def change
    create_table :education_items do |t|
      t.string :institution
      t.string :program
      t.string :location
      t.string :date
      t.string :qualification
      t.text :details
      t.references :cv, null: false, foreign_key: true

      t.timestamps
    end
  end
end
