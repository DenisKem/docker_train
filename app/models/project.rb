# == Schema Information
#
# Table name: projects
#
#  id                :integer          not null, primary key
#  name              :string
#  git_repo_url      :string
#  server_name       :string
#  max_keep_releases :integer          default("3")
#  summary           :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_projects_on_name  (name) UNIQUE
#

class Project < ApplicationRecord
  has_many :releases

  validates :name, :git_repo_url, :server_name, :max_keep_releases, presence: true
  validates :name, uniqueness: true

  def make_new_release
    release_name = "#{name}_#{DateTime.now}"
    tcp_port = '9999'
    container_id = '1234567890'

    releases.build name: release_name,
                   tcp_port: tcp_port,
                   container_id: container_id
  end

  def destroy_old_releases
    if releases.count > max_keep_releases
      releases.fresh_first.offset(max_keep_releases).destroy_all
    end
  end
end
