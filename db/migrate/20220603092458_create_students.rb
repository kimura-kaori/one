class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.date :update_date
      t.string :student_furigana
      t.string :student_name
      t.string :sex
      t.date :birthday
      t.integer :telephone
      t.integer :cellphone
      t.string :address
      t.string :parents_furigana
      t.string :parents_name
      t.string :relationship

      t.timestamps
    end
  end
end
