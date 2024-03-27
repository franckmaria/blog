class CreateParagraphs < ActiveRecord::Migration[7.1]
  def change
    create_table :paragraphs do |t|
      t.string :title
      t.text :content
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
