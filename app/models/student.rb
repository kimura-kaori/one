class Student < ApplicationRecord
  belongs_to :user
  has_many :student_family_environments, dependent: :destroy
  has_many :family_environments, through: :student_family_environments
end
