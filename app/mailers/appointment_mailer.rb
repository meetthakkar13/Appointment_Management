class AppointmentMailer < ApplicationMailer
  default from: 'meets9921@gmail.com'

  def appointment_confirmation_email
    @user = params[:user]
    @appointment = params[:appointment]
    @url = appointments_url

    mail(to: @user.email, subject: 'Your appointment is created')
  end

  def appointment_rescheduled_email(appointment)
    @user = params[:user]
    @user_appointment = User.where(id: appointment.doctors_id).first 
    @url = appointments_url

    emails = [@user.email, @user_appointment.email]
    mail(to: emails, subject: 'Your appointment is rescheduled')

    # mail(to: @user_appointment.email, subject: "Your appointment with '#{@user.email}' is rescheduled.")
  end
end
