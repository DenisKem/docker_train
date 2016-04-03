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

class Release < ApplicationRecord
  include AASM

  belongs_to :project

  validates :name, :project, :life_stage, presence: true
  validates :name, uniqueness: true

  scope :fresh_first, ->{ order(created_at: :desc) }

  after_create :clean_old_releases

  aasm column: :life_stage do
    state :cold, initial: true

    state :building

    state :running

    state :stopped

    event :build do
      transitions from: :cold, to: :building
    end

    event :run do
      transitions from: [:building, :stopped ], to: :running
    end

    event :stop do
      transitions from: :running, to: :stopped
    end


  end

  private
  def clean_old_releases
    project.reload.destroy_old_releases
  end
end
