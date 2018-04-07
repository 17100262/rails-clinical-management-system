class CreateMessageNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :message_notifications do |t|
      t.references :message, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
