class StudentFamilyEnvironment < ApplicationRecord
  belongs_to :student
  belongs_to :family_environment
end
