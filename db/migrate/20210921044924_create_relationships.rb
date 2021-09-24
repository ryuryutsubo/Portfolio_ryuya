class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :follower, foreign_key:  { to_table: :users }
      t.references :followed, foreign_key:  { to_table: :users }

      t.timestamps
    end
  end
end
