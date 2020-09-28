class CreateSubscribers < ActiveRecord::Migration[6.0]
  def change
    create_table :subscribers do |t|
      t.string :f_name
      t.string :l_name
      t.string :country
      t.string :email

      t.timestamps
    end
  end
end
