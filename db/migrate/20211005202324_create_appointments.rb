class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.date :appointment_date
      t.time :appointment_time
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
