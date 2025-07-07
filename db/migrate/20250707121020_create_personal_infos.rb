class CreatePersonalInfos < ActiveRecord::Migration[7.1]
  def change
    create_table :personal_infos do |t|
      t.string :name
      t.string :title
      t.string :email
      t.string :phone
      t.string :location
      t.string :linkedin
      t.string :github
      t.references :cv, null: false, foreign_key: true

      t.timestamps
    end
  end
end
