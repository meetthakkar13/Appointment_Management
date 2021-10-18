class AddSpecialitiesidToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :specialities_id, :bigint
  end
end
