class AddDoctoridToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :doctor_id, :bigint
  end
end
