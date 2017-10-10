class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
			t.string :name, null: false
			t.string :email, null: false
      t.boolean :moderator, null: false, default: false
      t.boolean :creator, null: false, default: false
      t.boolean :active, null: false, default: true
    end
    add_index :users, :name, unique: true
  end
end
