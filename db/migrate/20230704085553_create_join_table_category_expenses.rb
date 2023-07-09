class CreateJoinTableCategoryExpenses < ActiveRecord::Migration[7.0]
  def change
    create_join_table :category, :expenses do |t|
      t.index %i[category_id expense_id], unique: true
    end
  end
end
