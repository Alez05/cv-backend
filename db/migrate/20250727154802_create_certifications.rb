class CreateCertifications < ActiveRecord::Migration[7.1]
  def change
    create_table :certifications do |t|
      t.string :title
      t.string :name
      t.string :issuer
      t.date :date
      t.references :cv, null: false, foreign_key: true

      t.timestamps
    end
  end
end
