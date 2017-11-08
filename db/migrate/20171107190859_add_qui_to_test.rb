class AddQuiToTest < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :state, :string
    add_column :tests, :score_obtained, :integer
    add_column :tests, :total_score, :integer
    add_reference :tests, :quiz, polymorphic: true, index: true
  end
end
