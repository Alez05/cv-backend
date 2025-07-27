class CreateSummaries < ActiveRecord::Migration[7.1]
  def change
    create_table :summaries do |t|
      t.references :cv, null: false, foreign_key: true
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
