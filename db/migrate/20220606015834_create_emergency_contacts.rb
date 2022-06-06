class CreateEmergencyContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :emergency_contacts do |t|
      t.string :name
      t.string :relationship
      t.string :contact_address
      t.string :telephone
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
