class CreateTutors < ActiveRecord::Migration[5.2]
  def change
    create_table :tutors do |t|
      t.references :course, null: true
      t.string :first_name
      t.string :last_name
      t.integer :gender
      t.string :email

      t.timestamps
    end
    add_index :tutors, :email, unique: true
  end
end
