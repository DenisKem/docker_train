class CreateReleases < ActiveRecord::Migration[5.0]
  def change
    create_table :releases do |t|
      t.string :name
      t.references :project, foreign_key: true
      t.string :life_stage
      t.string :tcp_port
      t.string :container_id

      t.timestamps
    end
    add_index :releases, :name, unique: true
  end
end
