class AppointmentMailer < ApplicationMailer
  default from: 'meets9921@gmail.com'

  def appointment_confirmation_email(appointment)
    @user = params[:user]
    @user_appointment = User.where(id: appointment.doctor_id).first
    @url = appointments_url

    emails = [@user.email, @user_appointment.email]
    mail(to: emails, subject: 'New appointment is created')
  end

  def appointment_rescheduled_email(appointment)
    @user = params[:user]
    @user_appointment = User.where(id: appointment.user_id).first
    @url = appointments_url

    emails = [@user.email, @user_appointment.email]
    mail(to: emails, subject: 'Appointment is rescheduled')

    # mail(to: @user_appointment.email, subject: "Your appointment with '#{@user.email}' is rescheduled.")
  end
end
