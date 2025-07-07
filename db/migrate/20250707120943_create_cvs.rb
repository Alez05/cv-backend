class CreateCvs < ActiveRecord::Migration[7.1]
  def change
    create_table :cvs do |t|
      t.text :summary

      t.timestamps
    end
  end
end
