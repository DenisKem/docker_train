module ReleasesHelper

  def life_stage_postfix(release)

    if release.cold?
      'info'
    elsif release.building?
      'warning'
    elsif release.running
      'success'
    else
      'danger'
    end
  end
end
