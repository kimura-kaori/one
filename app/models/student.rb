class Student < ApplicationRecord
  belongs_to :user
  has_many :family_environments
  # has_many :student_family_environments, dependent: :destroy
  # has_many :my_family_environments, through: :student_family_environments, source: :family_environment
  # accepts_nested_attributes_for :family_environments

  has_many :emergency_contacts

end
