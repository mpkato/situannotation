class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :user, index: true, foreign_key: true
      t.references :sentence, index: true, foreign_key: true
      t.text :body

      t.timestamps null: false
    end
  end
end