class CreateDoctors < ActiveRecord::Migration[5.1]
  def change
    create_table :doctors do |t|
      t.string :email
      t.string :encrypted_password, null: false, default: ""

      t.references :city, index: true
      t.references :profession_status, index: true

      t.timestamps null: false
    end

    add_index :doctors, :email, unique: true
  end
end
