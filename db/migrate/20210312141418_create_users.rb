class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :full_name, null: false, default: ""
      t.string :email_address, null: false, default: ""
      t.string :password_digest, null: false, default: ""
      t.string :auth_token, null: false, default: ""

      t.timestamps
    end

    add_index :users, :email_address, unique: true
    add_index :users, :auth_token, unique: true
  end
end
