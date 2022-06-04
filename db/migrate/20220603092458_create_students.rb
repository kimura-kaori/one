class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :student_furigana
      t.string :student_name
      t.string :sex
      t.string :birthday
      t.string :telephone
      t.string :cellphone
      t.string :post_code
      t.string :address
      t.string :parents_furigana
      t.string :parents_name
      t.string :relationship

      t.timestamps
    end
  end
end
