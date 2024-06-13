class AddProfessionToServices < ActiveRecord::Migration[7.1]
  def change
    add_column :services, :profession, :string
  end
end
