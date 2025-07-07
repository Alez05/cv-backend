class CreateMains < ActiveRecord::Migration[7.1]
  def change
    create_table :mains do |t|
      t.string :CV
      t.string :title

      t.timestamps
    end
  end
end
