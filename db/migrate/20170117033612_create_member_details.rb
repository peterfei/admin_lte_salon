class CreateMemberDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :member_details do |t|
      t.references :member, foreign_key: true
      t.decimal :per_pay,precision: 10, scale: 2
      t.decimal :re_pay,precision: 10, scale: 2
      t.decimal :cumulative,precision: 10, scale: 2
      t.integer :createtime
      t.integer :operate_id, limit: 2

      t.timestamps
    end
  end
end
