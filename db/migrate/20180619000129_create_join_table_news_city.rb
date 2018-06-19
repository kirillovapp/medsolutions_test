class CreateJoinTableNewsCity < ActiveRecord::Migration[5.1]
  def change
    create_join_table :news, :cities do |t|
      # t.index [:news_id, :city_id]
      # t.index [:city_id, :news_id]
    end
  end
end
