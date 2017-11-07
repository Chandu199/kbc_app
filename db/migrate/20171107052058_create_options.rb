class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.text :description
      t.references :question, foreign_key: true
      t.boolean :answer

      t.timestamps
    end
  end
end
