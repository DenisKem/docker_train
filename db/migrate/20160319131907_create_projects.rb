class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :git_repo_url
      t.string :server_name
      t.integer :max_keep_releases, default: 3
      t.text :summary

      t.timestamps
    end

    add_index :projects, :name, unique: true
  end
end
