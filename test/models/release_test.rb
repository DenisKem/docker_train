# == Schema Information
#
# Table name: releases
#
#  id           :integer          not null, primary key
#  name         :string
#  project_id   :integer
#  life_stage   :string
#  tcp_port     :string
#  container_id :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_releases_on_name        (name) UNIQUE
#  index_releases_on_project_id  (project_id)
#

require 'test_helper'

class ReleaseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
