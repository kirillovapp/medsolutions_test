class CreateJoinTableNewsAudience < ActiveRecord::Migration[5.1]
  def change
    create_join_table :news, :audiences do |t|
      # t.index [:news_id, :audience_id]
      # t.index [:audience_id, :news_id]
    end
  end
end
