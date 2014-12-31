class GamesController < ApplicationController


	def new
		@game = Game.new
	end
	
	def create
		@game = Game.new(game_params)
		if @game.save
		
		  redirect_to edit_user_url(current_user.id)
		else
			render 'new'
		end
	end

 	private

    	def game_params

        params.require(:game).permit(:name, :private)

   		end
end





