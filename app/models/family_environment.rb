class FamilyEnvironment < ApplicationRecord
  belongs_to :student
  validates :relationship, presence: true
  validates :name, presence: true
  validates :birthday, presence: true
  validates :age, presence: true
  validates :family, presence: true
end
