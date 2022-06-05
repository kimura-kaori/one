class Student < ApplicationRecord
  belongs_to :user
  has_many :student_family_environment, dependent: :destroy
  # has_many :student_family_environment_family_environments, through: :student_family_environments, source: :family_environment
end
