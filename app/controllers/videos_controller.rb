class VideosController < ApplicationController

  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(self.video_params)

    # redirect
    if @video.save
      redirect_to videos_path
    # if it fails, just re-render the form
    else
      render :new
    end
  end

  def video_params
    params.require(:video).permit(:title, :embed_url, :released_on, :featured_artists)
  end

end
