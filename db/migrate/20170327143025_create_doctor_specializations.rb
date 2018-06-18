class CreateDoctorSpecializations < ActiveRecord::Migration[5.1]
  def change
    create_table :doctors_specializations do |t|
      t.references :doctor, index: true
      t.references :specialization, index: true
    end
  end
end
