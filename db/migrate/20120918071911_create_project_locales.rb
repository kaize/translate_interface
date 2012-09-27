class CreateProjectLocales < ActiveRecord::Migration
  def change
    create_table :project_locales do |t|
      t.integer :locale_id
      t.integer :project_id

      t.timestamps
    end
  end
end
