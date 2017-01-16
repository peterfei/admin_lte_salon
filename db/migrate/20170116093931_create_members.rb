class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :cid
      t.integer :sex, limit: 2
      t.integer :level
      t.decimal :blance ,precision: 10, scale: 2
      t.string :phone, :unique => true
      t.text :remark

      t.timestamps
    end
  end
end
