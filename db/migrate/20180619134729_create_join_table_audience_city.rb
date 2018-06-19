class CreateJoinTableAudienceCity < ActiveRecord::Migration[5.1]
  def change
    create_join_table :audiences, :cities do |t|
      # t.index [:audience_id, :city_id]
      # t.index [:city_id, :audience_id]
    end
  end
end
