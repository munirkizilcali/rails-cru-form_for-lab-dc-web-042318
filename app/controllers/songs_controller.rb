class SongsController < ApplicationController

	before_action :find_song, only: [:show, :edit, :update]
	def new
		@song = Song.new
	end

	def create
		@song = Song.create(user_params(:name, :artist_id, :genre_id))
		redirect_to(song_path(@song))
	end

	def index
		@songs = Song.all
	end

	def show

	end

	def edit

	end

	def update
		@song.update(user_params(:name, :artist_id, :genre_id))
		@song.save
		redirect_to(song_path(@song))
	end

	private

	def find_song
		@song = Song.find(params[:id])
	end

	def user_params(*args)
    	params.require(:song).permit(*args)
  	end

end
