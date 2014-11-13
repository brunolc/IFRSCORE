class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :email, limit: 30
      t.string :username, limit: 30
      t.string :senha, limit: 32

      t.timestamps
    end
  end
end
