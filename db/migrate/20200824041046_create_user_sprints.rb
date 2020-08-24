class CreateUserSprints < ActiveRecord::Migration[6.0]
  def change
    create_table :user_sprints do |t|
      t.references :user, null: false, foreign_key: true
      t.references :sprint, null: false, foreign_key: true

      t.timestamps
    end
  end
end
