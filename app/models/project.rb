# == Schema Information
#
# Table name: projects
#
#  id                :integer          not null, primary key
#  name              :string
#  git_repo_url      :string
#  server_name       :string
#  max_keep_releases :integer
#  summary           :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Project < ApplicationRecord
end
