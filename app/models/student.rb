class Student < ApplicationRecord
  belongs_to :user
  has_many :family_environments
  has_many :emergency_contacts

  validates :student_furigana, :student_name, :sex, :birthday, :telephone, :cellphone,:post_code, :address, :parents_furigana, :parents_name, :relationship, presence: true
end
