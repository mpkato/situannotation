class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.string :sid
      t.text :body

      t.timestamps null: false
    end
  end
end
