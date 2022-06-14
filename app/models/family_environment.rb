class FamilyEnvironment < ApplicationRecord
  belongs_to :student
  validates :relationship, :name, :birthday, :age, :family, presence: true
end
