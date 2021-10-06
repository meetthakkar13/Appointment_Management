# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, Doctor
      can :manage, Role
    elsif user.doctor?
      can :read, Appointment do |appointment|
        appointment.try(:user) == user
      end
      can :update, Appointment do |appointment|
        appointment.try(:user) == user
      end
      can :destroy, Appointment do |appointment|
        appointment.try(:user) == user
      end
    elsif user.patient?
      can :read, Appointment do |appointment|
        appointment.try(:user) == user
      end
      can :create, Appointment
      can :update, Appointment do |appointment|
        appointment.try(:user) == user
      end
      can :destroy, Appointment do |appointment|
        appointment.try(:user) == user
      end
    end
  end
end
