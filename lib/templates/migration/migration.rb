class ActsAsActor < ActiveRecord::Migration
  
  def change
    create_table :roles do |t|
      t.string :name, :null => false
      t.integer :access_level, :default => 0
      t.timestamps
    end

    create_table :user_roles do |t|
      t.references :user
      t.references :role
      t.timestamps
    end
  end

end
