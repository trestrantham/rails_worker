class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :desc
      t.decimal :value

      t.timestamps null: false
    end
  end
end
