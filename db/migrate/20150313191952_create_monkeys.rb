class CreateMonkeys < ActiveRecord::Migration
  def change
    create_table :monkeys do |t|

      t.timestamps null: false
    end
  end
end
