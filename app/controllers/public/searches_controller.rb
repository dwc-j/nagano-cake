class Public::SearchesController < ApplicationController
	def genre_search
		@genres = Genre.all
		genre_id = params[:genre_id]
		@genre = Genre.find(genre_id)
		items = Item.where(genre_id: genre_id)
		@items = items.page(params[:page]).per(8)
	end
end
