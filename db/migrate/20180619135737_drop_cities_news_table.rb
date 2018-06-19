class DropCitiesNewsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :cities_news, id: false do |t|
      t.integer :news_id, null: false
      t.integer :city_id, null: false
    end
  end
end
