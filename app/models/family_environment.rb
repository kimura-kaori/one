class FamilyEnvironment < ApplicationRecord
  has_many :student_family_environment, dependent: :destroy
  has_many :student_family_environment_students, through: :student_family_environments, source: :student
end
