class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.decimal :amount
      t.integer :author_id, null: false, foreign_key: { to_table: :users }
      t.integer :category_ids, array: true, default: [], null: false
      t.timestamps
    end
  end
end
