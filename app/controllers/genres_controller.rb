class GenresController < ApplicationController
	before_action :find_genre, only: [:show, :edit, :update]
	def new
		@genre = Genre.new
	end

	def create
		@genre = Genre.create(user_params(:name))
		redirect_to(genre_path(@genre))
	end

	def index
		@genres = Genre.all
	end

	def show

	end

	def edit

	end

	def update
		@genre.update(user_params(:name))
		@genre.save
		redirect_to(genre_path(@genre))
	end

	private

	def find_genre
		@genre = Genre.find(params[:id])
	end

	def user_params(*args)
    	params.require(:genre).permit(*args)
  	end

end
