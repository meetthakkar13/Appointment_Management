class AddCompletedToAppointment < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :completed, :boolean
  end
end
