class GamesController < ApplicationController


	def new
		@game = Game.new
	end
	
	def create
		@game = Game.new(game_params)
		if @game.save
		  redirect_to edit_user_path(current_user)
		else
			render 'new'
		end
	end

 	private

    	def game_params

        params.require(:game).permit(:name, :private)

   		end
end





