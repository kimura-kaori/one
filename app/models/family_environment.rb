class FamilyEnvironment < ApplicationRecord
  has_many :student_family_environment, dependent: :destroy
end
