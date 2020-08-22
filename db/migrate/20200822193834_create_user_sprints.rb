class CreateUserSprints < ActiveRecord::Migration[6.0]
  def change
    create_table :user_sprints do |t|

      t.timestamps
    end
  end
end
