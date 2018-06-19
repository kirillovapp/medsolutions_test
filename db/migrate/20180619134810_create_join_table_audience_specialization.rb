class CreateJoinTableAudienceSpecialization < ActiveRecord::Migration[5.1]
  def change
    create_join_table :audiences, :specializations do |t|
      # t.index [:audience_id, :specialization_id]
      # t.index [:specialization_id, :audience_id]
    end
  end
end
