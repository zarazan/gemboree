class ActsAsActor < ActiveRecord::Migration
  
  def change
    create_table :roles do |t|
      t.string :name
      t.integer :access_level
      t.timestamps
    end

    create_table :user_roles do |t|
      t.references :user
      t.references :role
      t.timestamps
    end
  end

end