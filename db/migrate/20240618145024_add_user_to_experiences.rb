class AddUserToExperiences < ActiveRecord::Migration[7.1]
  def change
    add_reference :experiences, :user, foreign_key: true
  end
end
