class AlbumsController < ApplicationController
  before_action :set_artist, only: :index

  def index
    @albums = policy_scope(@artist.albums)
  end

  private

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end
end
