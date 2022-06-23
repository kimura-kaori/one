class CreateFamilyEnvironments < ActiveRecord::Migration[6.0]
  def change
    create_table :family_environments do |t|
      t.string :relationship
      t.string :name
      t.date :birthday
      t.integer :age
      t.string :family

      t.timestamps
    end
  end
end
