class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :type
      t.references :actor, index: true, foreign_key: true
      t.references :repo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
