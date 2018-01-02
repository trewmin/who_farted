class CreateFarts < ActiveRecord::Migration[5.1]
  def change
    create_table :farts do |t|
      t.belongs_to :group, foreign_key: true
      t.belongs_to :smelter
      t.belongs_to :delter

      t.timestamps
    end
  end
end
