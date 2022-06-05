class Student < ApplicationRecord
  belongs_to :user
  has_many :student_family_environment, dependent: :destroy
end
