class AlbumsController < ApplicationController
  before_action :set_artist, only: [:index, :edit, :update, :destroy]
  before_action :set_album, only: [:edit, :update, :destroy]

  def index
    @albums = policy_scope(@artist.albums)
  end

  def new
    @artists_names = artists_names
    @album = Album.new
    authorize @album
  end

  def create
    @album = Album.new(album_params)
    @artist = Artist.find(params[:album][:artist].to_i)
    @album.artist = @artist
    authorize @album
    if @album.save!
      redirect_to artist_albums_path(@artist), notice: 'Your album was successfully created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @album.update(album_params)
      redirect_to artist_albums_path(@artist), notice: "Your album was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @album.destroy
    redirect_to artist_albums_path(@artist), notice: 'Album was successfully deleted'
  end

  private

  def artists_names
    Artist.all.each { |artist| artist.name }
  end

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def album_params
    params.require(:album).permit(:name, :year)
  end

  def set_album
    @album = Album.find(params[:id])
    authorize @album
  end

end
