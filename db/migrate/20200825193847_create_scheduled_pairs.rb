class CreateScheduledPairs < ActiveRecord::Migration[6.0]
  def change
    create_table :scheduled_pairs do |t|
      t.references :pair, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
