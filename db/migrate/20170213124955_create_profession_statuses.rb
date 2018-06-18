class CreateProfessionStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :profession_statuses do |t|
      t.string :title
    end
  end
end
