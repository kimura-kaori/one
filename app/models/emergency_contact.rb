class EmergencyContact < ApplicationRecord
  belongs_to :student
  validates :name, presence: true
  validates :relationship, presence: true
  validates :contact_address, presence: true
  validates :telephone, presence: true
end
