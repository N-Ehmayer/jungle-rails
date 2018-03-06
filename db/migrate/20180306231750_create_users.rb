class CreateUsers < ActiveRecord::Migration
  def change
    t.string :name
    t.string :email
    t.string :password_digest
  end
end
