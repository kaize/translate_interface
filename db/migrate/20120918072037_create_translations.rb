class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.string :data
      t.integer :key_id
      t.integer :locale_id
      t.integer :member_id

      t.timestamps
    end
  end
end
