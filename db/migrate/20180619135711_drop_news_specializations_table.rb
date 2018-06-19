class DropNewsSpecializationsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :news_specializations, id: false do |t|
      t.integer :news_id, null: false
      t.integer :specialization_id, null: false
    end
  end
end
