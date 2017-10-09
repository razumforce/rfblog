class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
    	t.integer :rating, null: false
      t.references :user, foreign_key: true, null: false
      t.references :post, foreign_key: true, null: false
      
      t.timestamps
    end
  end
end
