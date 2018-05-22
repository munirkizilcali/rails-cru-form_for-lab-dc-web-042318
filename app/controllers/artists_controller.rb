class ArtistsController < ApplicationController

	before_action :find_artist, only: [:show, :edit, :update]
	def new
		@artist = Artist.new
	end

	def create
		@artist = Artist.create(user_params(:name, :bio))
		redirect_to(artist_path(@artist))
	end

	def index
		@artists = Artist.all
	end

	def show

	end

	def edit

	end

	def update
		@artist.update(user_params(:name, :bio))
		@artist.save
		redirect_to(artist_path(@artist))
	end

	private

	def find_artist
		@artist = Artist.find(params[:id])
	end

	def user_params(*args)
    	params.require(:artist).permit(*args)
  	end


end
