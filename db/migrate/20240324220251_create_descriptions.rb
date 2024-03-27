class CreateDescriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :descriptions do |t|
      t.string :name
      t.text :descriptionUser
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
