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
end
