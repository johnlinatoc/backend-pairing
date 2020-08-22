class CreateSprints < ActiveRecord::Migration[6.0]
  def change
    create_table :sprints do |t|

      t.timestamps
    end
  end
end
