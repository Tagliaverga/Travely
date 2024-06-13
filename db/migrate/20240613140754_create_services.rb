class CreateServices < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.references :user, null: false, foreign_key: true
      t.float :price
      t.string :local
      t.string :description

      t.timestamps
    end
  end
end
