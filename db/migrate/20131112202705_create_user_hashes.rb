class CreateUserHashes < ActiveRecord::Migration
  def change
    create_table :user_hashes do |t|
      t.string :full_hash

      t.timestamps
    end
  end
end
