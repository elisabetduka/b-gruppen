class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.int :id
      t.string :name
      t.date :member_since
      t.varchar :password
      t.varchar :email

      t.timestamps
    end
  end
end
