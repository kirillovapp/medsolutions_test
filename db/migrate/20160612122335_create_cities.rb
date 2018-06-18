class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :title
      t.string :region
      t.references :country, index: true
    end
  end
end
