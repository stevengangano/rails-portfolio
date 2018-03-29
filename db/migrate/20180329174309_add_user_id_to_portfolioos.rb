class AddUserIdToPortfolioos < ActiveRecord::Migration
  def change
    add_column :portfolioos, :user_id, :integer
  end
end
