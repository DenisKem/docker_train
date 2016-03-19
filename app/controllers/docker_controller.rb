class DockerController < ApplicationController
  def images
    @images = Docker::Image.all
  end

  def ps
    @ps = Docker::Container.all
  end

  def tail
    @container = Docker::Container.get(params[:id])
  end
end
