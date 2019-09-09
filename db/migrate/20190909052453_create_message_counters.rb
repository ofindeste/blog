class CreateMessageCounters < ActiveRecord::Migration[6.0]
  def change
    create_table :message_counters do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :count

      t.timestamps
    end
  end
end
