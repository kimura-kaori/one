class FamilyEnvironment < ApplicationRecord
  has_many :student_family_environments, dependent: :destroy
  has_many :students, through: :student_family_environments
end
