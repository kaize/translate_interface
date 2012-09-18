class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.string :name
      t.integer :project_id

      t.timestamps
    end
  end
end
