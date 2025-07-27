class CreatePersonalInfos < ActiveRecord::Migration[7.1]
  def change
    create_table :personal_infos do |t|
      t.references :cv, null: false, foreign_key: true
      t.string :title
      t.string :name
      t.string :email
      t.string :phone
      t.string :location
      t.string :linkedin
      t.string :github

      t.timestamps
    end
  end
end
