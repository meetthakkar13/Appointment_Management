class Appointment < ApplicationRecord
  belongs_to :user

  validate :appointment_datetime_cannot_be_in_the_past

  validate :is_available?


  def is_available?
    Appointment.where(:appointment_datetime == self.appointment_datetime).where(:doctor_id == self.doctor_id).present? 
    # errors.add("Appointment is overlapping")
  end


  def appointment_datetime_cannot_be_in_the_past
    if appointment_datetime.present? && appointment_datetime < DateTime.now
      errors.add(:appointment_datetime, "can't be in the past")
    end
  end

  scope :updated, ->(_updated_at) { where status: status }
  scope :completed, ->(_completed) { where completed: true }
  # scope :canceled, -> (name) { where("name like ?", "#{name}%")}
  scope :rescheduled, ->(updated_at) { where(updated_at != created_at) }
end
