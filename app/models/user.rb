class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :role, optional: true
  has_one :profile
  has_many :appointments
  has_many :patients, class_name: "User",
                          foreign_key: "doctor_id"

  belongs_to :doctors, class_name: "User", optional: true
  before_create :assign_role

  def assign_role
    self.role = Role.find_by name: 'Patient' if role.nil?
  end

  def admin?
    role.name == 'Admin'
  end

  def doctor?
    role.name == 'Doctor'
  end

  def patient?
    role.name == 'Patient'
  end
end
