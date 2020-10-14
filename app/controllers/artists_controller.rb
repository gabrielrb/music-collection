class ArtistsController < ApplicationController
  def index
    @artists = policy_scope(Artist)
  end
end
