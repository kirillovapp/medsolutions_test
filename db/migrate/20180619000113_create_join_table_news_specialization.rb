class CreateJoinTableNewsSpecialization < ActiveRecord::Migration[5.1]
  def change
    create_join_table :news, :specializations do |t|
      # t.index [:news_id, :specialization_id]
      # t.index [:specialization_id, :news_id]
    end
  end
end
