class CreateClaims < ActiveRecord::Migration[7.1]
  def change
    create_table :claims do |t|
      t.integer :how
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
