class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :business_name
      t.string :email
      t.string :phone
      t.text :question1
      t.text :question2

      t.timestamps null: false
    end
  end
end
