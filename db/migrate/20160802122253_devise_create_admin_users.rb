class DeviseCreateAdminUsers < ActiveRecord::Migration[5.1]
  def change
    create_table(:admin_users) do |t|
      ## Database authenticatable
      t.string :email

      t.string :encrypted_password, null: false, default: ""

      ## Rememberable
      t.datetime :remember_created_at

      t.timestamps null: false
    end

    add_index :admin_users, :email, unique: true
  end
end
