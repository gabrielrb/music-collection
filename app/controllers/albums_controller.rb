class AlbumsController < ApplicationController
  before_action :set_artist, only: [:index, :new, :create]

  def index
    @albums = policy_scope(@artist.albums)
  end

  def new
    @artists = Artist.all
    @album = Album.new
    @album.artist = @artist
    authorize @album
  end

  def create
    @album = Album.new(album_params)
    @album.artist = @artist
    authorize @album
    if @album.save!
      redirect_to artist_albums_path(@artist), notice: 'Your album was successfully created'
    else
      render :new
    end
  end

  private



  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def album_params
    params.require(:album).permit(:name, :year)
  end
end
