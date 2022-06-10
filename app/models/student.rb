class Student < ApplicationRecord
  belongs_to :user
  has_many :family_environments
  has_many :emergency_contacts

  validates :student_furigana, presence: true
  validates :student_name, presence: true
  validates :sex, presence: true
  validates :birthday, presence: true
  validates :telephone, presence: true
  validates :cellphone, presence: true
  validates :post_code, presence: true
  validates :address, presence: true
  validates :parents_furigana, presence: true
  validates :parents_name, presence: true
  validates :relationship, presence: true
end
