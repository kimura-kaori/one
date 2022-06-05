class CreateStudentFamilyEnvironments < ActiveRecord::Migration[6.0]
  def change
    create_table :student_family_environments do |t|
      t.references :student, foreign_key: true
      t.references :family_environment, foreign_key: true

      t.timestamps
    end
  end
end
