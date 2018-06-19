class CreateJoinTableAudienceProfessionStatus < ActiveRecord::Migration[5.1]
  def change
    create_join_table :audiences, :profession_statuses do |t|
      # t.index [:audience_id, :profession_status_id]
      # t.index [:profession_status_id, :audience_id]
    end
  end
end
