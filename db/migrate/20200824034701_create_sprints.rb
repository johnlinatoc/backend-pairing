class CreateSprints < ActiveRecord::Migration[6.0]
  def change
    create_table :sprints do |t|
      t.references :schedule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
