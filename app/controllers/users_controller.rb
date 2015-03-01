class UsersController < ApplicationController

	respond_to :html, :json
	helper UsersHelper

# User creation - Perfect, Don't Touch!
	def new
		@user = User.new
	end
	
	def create

		@user = User.new(user_params)

		if @user.save
			sign_in(@user)
			redirect_to edit_user_url(@user.id)

		else

			render 'new'

		end
	end

	def show

		@user = User.find(params[:id])
		@game = Game.find(@user.game_id)

		@users = @game.users

		@battles = Array.new
		
		@game.battles.each do |battle|
		if battle.user_one_id == @user.id || battle.user_two_id == @user.id
				@battles << battle
			end
		end

		@battles.each_with_index do |battle, index|

			@battles[index] = [@battles[index],createBoardArray(battle)]

		end

		@forts = @game.forts

		@user.user_game_attributes.each do |attribute|
			if attribute.game_id == @game.id
				@attribute = attribute
			end
		end

		@encampments = Array.new
		@user.encampments.each do |encampment|
		if encampment.game_id == @user.game_id
				@encampments << encampment
			end
		end

		@game.encampments.each do |encampment|
		if @game[encampment.territory.gsub("#","") + "owner_id"] == @attribute.user_id
			@encampments << encampment
		end
		end
		@clientItinerary = Array.new

		@game.trades.each do |i|
		
			if i.recipient_user_id == @user.id || i.sending_user_id == @user.id

				@clientItinerary << [i.what,i.quantity,Array.new]
				i.legs.each do |y|

@clientItinerary[@clientItinerary.length - 1][2] << [y.location_id,y.location_type]
				end
			end
		end

		
		@territoryOwners = Array.new
		@territoryColors = Array.new

		@game.attributes.each do |attr_name, attr_value|
			if attr_name != "id" && attr_name != "created_at" && attr_name != "updated_at" && attr_name != "name" && attr_name != "private" && attr_value.instance_of?(NilClass) != true
				if UserGameAttribute.find(attr_value).color.instance_of?(NilClass) != true
@territoryColors << Array.new
colorUser = UserGameAttribute.find(attr_value)
@territoryOwners << Array.new
@territoryOwners[@territoryOwners.length - 1] << colorUser.user_id
@territoryOwners[@territoryOwners.length - 1] << User.find(colorUser.user_id).username
@territoryOwners[@territoryOwners.length - 1] << attr_name.gsub(/\_owner_id\b/, '')

@territoryColors[@territoryColors.length - 1] << colorUser.color[0,2].insert(0, "0x").hex
@territoryColors[@territoryColors.length - 1] << colorUser.color[2,2].insert(0, "0x").hex
@territoryColors[@territoryColors.length - 1] << colorUser.color[4,6].insert(0, "0x").hex
				end
			end
		end

	end
	




	def edit

		@user = User.find(params[:id])
		@currentGames = @user.game_attributes
		@games = Array.new
		valid = true
		Game.all.each do |game|
			@currentGames.each do |currentgame|
				if game.id == currentgame.game_id
					valid = false
				end
			end
			if valid == true 
				@games << game
			end
		end
		logger.info @games
		@game = Game.new()

	end

# All the logic happens here - Do touch

  def update

    @user = User.find(params[:id])
	@game = Game.find(@user.game_id)

	if params[:user][:game_id] != nil 

		if params[:user][:game_attributes][:name] != nil

			@game = @user.games.build(:private => params[:user][:game_attributes][:private], :name => params[:user][:game_attributes][:name])

			@game.save
			@user.game_id = @game.id
			@user.color = params[:user][:color]
			if  @user.save

				redirect_to user_url(@user.id)
			else

				redirect_to edit_user_url(@user.id)
			end
		else

			User.update(@user.id, :game_id => params[:user][:game_id])
			@gameAttribute = @user.user_game_attributes.build(user_params[:game_attributes])
			@gameAttribute.save
			@game = Game.find(params[:user][:game_id])

				if User.update(@user.id, :game_id => params[:user][:game_id])

					redirect_to user_path(@user.id)
				end
			@game.attributes.each do |attr_name, attr_value|
				if attr_name != "id" && attr_name != "created_at" && attr_name != "updated_at" && attr_name != "name" && attr_name != "private"

					gameThings = {params[:user][:game_id]  => { attr_name => @gameAttribute.id }}
					Game.update(gameThings.keys, gameThings.values)
				end
			end
		end
	end

	if user_params[:pieces_attributes] != nil

		if user_params[:pieces_attributes]["1000"] != nil

			@piece = Piece.find(user_params[:pieces_attributes]["1000"][:id])
			@battle = Battle.find(@piece.battle_id)
=begin
			if @battle.turn == @user.id

				if @battle.turn == @battle.user_one_id

					@battle.update(:turn => @battle.user_two_id)
				else

					@battle.update(:turn => @battle.user_one_id)
			end
=end
			board = createBoardArray(@battle)


			#if move == user_params[:pieces_attributes]["1000"][:coordinates]


						@move = [user_params[:pieces_attributes]["1000"][:coordinates].split("")[0].to_i, user_params[:pieces_attributes]["1000"][:coordinates].split("")[1].to_i]
						@oldmove = @piece.coordinates
						@empty = Array.new
						@battle.pieces.each do |piece|

							if piece.coordinates == @move[0].to_s + ","+@move[1].to_s

								piece.destroy
								@empty << piece.coordinates.gsub(",","")
							end
						end
						respond_to do |format|
							if @piece.update( :coordinates => ((user_params[:pieces_attributes]["1000"][:coordinates].split("")[0].to_i).to_s + ","+ (user_params[:pieces_attributes]["1000"][:coordinates].split("")[1].to_i).to_s), :first_move => "t")
								format.html { redirect_to @user, notice: 'User was successfully created.' }
					   		        format.js   {render action: 'show', status: :created, location: @user}
						 		format.json { render json: @piece, status: :created, location: @user }
							else
								format.html { render action: "show" }
								format.json { render json: @piece.errors, status: :unprocessable_entity }
								format.js   { render json: @user.errors, status: :unprocessable_entity}

							end
						end

					#end
				#end
			#end
		end
	end


	if user_params[:trades_attributes] != nil
		y = "100000000000"
		itinerary = Array.new

		while user_params[:trades_attributes][:"100000000000"][:legs_attributes][y] != nil do
			
			itinerary << user_params[:trades_attributes][:"100000000000"][:legs_attributes][y]

			y = (y.to_i + 1).to_s
		end
		submitedCost = user_params[:trades_attributes][:"100000000000"][:cost].to_f

		if submitedCost > calculateTradeCost(itinerary)[0] && submitedCost < calculateTradeCost(itinerary)[1]
			
			@trade = Trade.new(user_params[:trades_attributes][:"100000000000"])
			@trade.game_id = @user.game_id
			@trade.sending_user_id = @user.id

			firstLegParams = user_params[:trades_attributes][:"100000000000"][:legs_attributes][:"100000000000"]
			y = "100000000000"

			while user_params[:trades_attributes][:"100000000000"][:legs_attributes][y] != nil do
			
				lastLegParams = user_params[:trades_attributes][:"100000000000"][:legs_attributes][y]

				y = (y.to_i + 1).to_s
			end

			@trade.recipient_location_id = lastLegParams[:location_id]
			@trade.sending_location_id = firstLegParams[:location_id]
			@trade.recipient_location_type = lastLegParams[:location_type]
			@trade.sending_location_type = firstLegParams[:location_type]

			if lastLegParams[:location_id].gsub(" ","") != lastLegParams[:location_id]

				@trade.recipient_user_id = "-1"
			elsif lastLegParams[:location_type] == "fort"

				@trade.recipient_user_id = Fort.find(lastLegParams[:location_id]).user_id
			elsif lastLegParams[:location_type] == "encampment"

				@trade.recipient_user_id = Encampment.find(lastLegParams[:location_id]).user_id
			end
			@clientItinerary = Array.new
			y = "100000000000"
			while user_params[:trades_attributes][:"100000000000"][:legs_attributes][y] != nil do

				if user_params[:trades_attributes][:"100000000000"][:legs_attributes][y][:location_type] == "fort"

@clientItinerary << [user_params[:trades_attributes][:"100000000000"][:legs_attributes][y][:location_id],"fort"]
				elsif user_params[:trades_attributes][:"100000000000"][:legs_attributes][y][:location_type] == "encampment"

@clientItinerary << [user_params[:trades_attributes][:"100000000000"][:legs_attributes][y][:location_id],"encampment"]
				elsif user_params[:trades_attributes][:"100000000000"][:legs_attributes][y][:location_type] == "seapoint"

@clientItinerary << [user_params[:trades_attributes][:"100000000000"][:legs_attributes][y][:location_id],"seapoint"]
				end
				y = (y.to_i + 1).to_s
			end	

			respond_to do |format|
			    if @trade.save
			      format.html { redirect_to @user, notice: 'User was successfully created.' }
			      format.js   {render action: 'show', status: :created, location: @user}
			      format.json { render json: @trade, status: :created, location: @user }
			    else
			      format.html { render action: "show" }
			      format.json { render json: @trade.errors, status: :unprocessable_entity }
			      format.js   { render json: @user.errors, status: :unprocessable_entity}

			    end
			  end

		end
	end
	if  user_params[:forts_attributes] != nil
		if user_params[:forts_attributes][:"100000000000"] != nil

			@fort = @user.forts.build(user_params[:forts_attributes][:"100000000000"])
			@fort.game_id = @user.game_id

			respond_to do |format|
				if @fort.save

format.html { redirect_to @user, notice: 'Fort was successfully created.' }
format.js   {}
format.json { render json: @fort, status: :updated, location: @user }
else

format.html { render action: "show" }
format.json { render json: @user.errors, status: :unprocessable_entity }
				end
			end

		end
	end
	if  user_params[:encampments_attributes] != nil
		if user_params[:encampments_attributes][:"100000000000"] != nil

			@encampment = @user.encampments.build(user_params[:encampments_attributes][:"100000000000"])
			@encampment.game_id = @user.game_id

			respond_to do |format|
				if @encampment.save

format.html { redirect_to @user, notice: 'Fort was successfully created.' }
format.js   {}
format.json { render json: @encampment, status: :updated, location: @user }
else

format.html { render action: "show" }
format.json { render json: @user.errors, status: :unprocessable_entity }
				end
			end
		end
	end

	if user_params[:battles_attributes] != nil
		if user_params[:battles_attributes][:"100000000000"] != nil

			@battle = Battle.new(user_params[:battles_attributes][:"100000000000"])
			@battle.game_id = @game.id
			@battle.user_one_id = @user.id		
			@battle.turn = @user.id		
			if @battle.user_two_id != @user.id
				if @battle.battle_type == "chess"
					initChessBoard(user_params[:battles_attributes][:"100000000000"][:user_two_id])

					@board = createBoardArray(@battle)
					@battle.pending = "f"
				else 
					@battle.pending = "t"				
				end

				respond_to do |format|
				    if @battle.save
				      format.html { redirect_to @user, notice: 'User was successfully created.' }
				      format.js   {render action: 'show', status: :created, location: @user}
				      format.json { render json: @battle, status: :created, location: @user }
				    else
				      format.html { render action: "show" }
				      format.json { render json: @battle.errors, status: :unprocessable_entity }
				      format.js   { render json: @user.errors, status: :unprocessable_entity}

				    end
				end

			end


		end
	end

	end

 	private

    	def user_params

        params.require(:user).permit(:name, :email, :username, :password, :password_confirmation, :game_id, :color, forts_attributes: [ :name, :xco, :yco, :territory, :ownership, :id, :date_created, :game_id], encampments_attributes: [ :name, :xco, :yco, :territory, :id, :date_created, :game_id], pieces_attributes: [ :coordinates, :id], battles_attributes:[:user_two_id, :location_two_id, :location_two_type, :location_one_type, :location_one_id, :battle_type, :type ],game_attributes: [:game_id, :name, :private],trades_attributes: [:cost, :sending_user_id, :recipient_user_i, :game_id, :sending_fort_id, :what, :quantity, :recipient_fort_id, legs_attributes: [:location_id, :location_type, :trade_index], trade_proposal: [:what, :quantity, :location_id, :location_type, :durration]])

   		end


def calculateTradeCost(itinerary)
		colors = [["central_america", [0xe5,0x42,0x42], [488,780] ,[0.311006362]],
	["central_asia",[0xf1,0x71,0x71], [2054,526] ,[0.284473688]],
	[" central_south_america",[0xfb,0x07,0x07], [822,1020],[0.402101331]], 
	["china",[0xfb,0x07,0xca], [2342,542] ,[0.073106002]], 
	["coastal_africa",[0xd0,0x2e,0xb0], [1436,959] ,[0.653478724]], 
	["coastal_south_america",[0xc4,0x56,0xae], [908,1340] ,[1.025283875]],
	[" congo",[0x87,0x13,0x70], [1720,1015] ,[4.093718719]], 
	["eastern_africa",[0x96,0x0e,0xbd], [1844,887] ,[3.45647866]], 
	["eastern_canada",[0xc1,0x52,0xe1], [394,206] ,[0.338781336]], 
	["eastern_south_america",[0xc6,0x00,0xff], [904,1088] ,[1.078443444]], 
	["egypt",[0x5d,0x1e,0x6f], [1724,774] ,[0.143233025]], 
	["greenland",[0x48,0x0e,0xcb], [918,204] ,[1]],
	[" iceland",[0x84,0x55,0xef], [1393,399] ,[0.566702988]],
	[" india",[0x32,0x3a,0xde], [2278,786] ,[0.023725458]], 
	["indonesia",[0x5f,0x65,0xd0], [2558,1084] ,[0.177003406]], 
	["madagascar",[0x5f,0xa4,0xd0], [2052,1280] ,[2.751700999]],
	[" middle_east",[0x0f,0x97,0xed], [1868,664] ,[0.218084511]], 
	["mongolia",[0x33,0x79,0xa6], [2480,568] ,[8.573449039]], 
	["new_zealand",[0x06,0xb5,0x6d], [3010,1163] ,[0.292389938]],
	["non_contiguous_united_states",[0x7e,0xc2,0xed], [0,340] ,[1.555525194]],
	[" northeastern_united_states",[0x30,0xcf,0xd5], [704,596] ,[0.02432892]], 
	["northern_australia",[0x6b,0xf6,0xfb], [2872,1260] ,[1.060924816]], 
	["northern_europe",[0x22,0x7f,0x82], [1647,500] ,[0.03048697]],
	[" northwestern_united_states",[0x67,0x91,0x93], [414,598] ,[0.145380297]], 
	["pacific_asia",[0x73,0xe1,0xb4], [2834,526] ,[0.014887273]], 
	[" russia",[0x23,0xab,0x73], [1902,206] ,[0.484910872]],
	[" sahara",[0x23,0xab,0x33], [1454,730] ,[1.277875253]], 
	["southeastern_asia",[0x7b,0xe1,0x87], [2406,800] ,[0.123679885]], 
	["southeastern_united_states",[0x00,0xff,0x1e], [718,734] ,[0.03018645]], 
	["southern_african_territory",[0x19,0x77,0x24], [1732,1242] ,[0.986084614]],
	[" southern_australia",[0x50,0x7E,0x55], [2714,1296] ,[0.442689699]], 
	["southern_europe",[0x8f,0xc6,0x40], [1688,602] ,[0.035175045]], 
	["southwestern_united_states",[0x51,0x8a,0x00], [406,660] ,[0.059710917]],
	[" ukraine",[0x97,0xde,0x32], [1660,340] ,[0.076732312]], 
	["united_kingdom", [0x19,0xaf,0xe0], [1522,490] ,[0.01625007]],
	[" western_europe",[0x8a,0xa6,0x33], [1520,578] ,[0.018317252]],
	[" western_canada", [0xff,0xea,0x3d], [250,349] ,[1.358437809]], 
	["western_south_america",[0xea,0xdb,0x35], [834,1143] ,[2.043553816]]]

		totalCost = 0
	
		oldxco = false
		oldyco = false

		itinerary.each do |i|

			totalLegCost = 0

			xco = false
			yco = false

			if i[:location_type] == 'encampment'
				encampment =  Encampment.find(i[:location_id])
				xco = encampment.xco
				yco = encampment.yco

				colors.each_with_index do |f,index|

if colors[index][0] == encampment.territory.gsub("#","") 
	xco = xco + colors[index][2][0]
	yco = yco + colors[index][2][1]
end

				end

			elsif i[:location_type] == 'fort'

				fort =  Fort.find(i[:location_id])
				xco = fort.xco
				yco = fort.yco

				colors.each_with_index do |f,index|
if colors[index][0] == fort.territory.gsub("#","") 
	xco = xco + colors[index][2][0]
	yco = yco + colors[index][2][1]
end
				end

			elsif i[:location_type] == 'seapoint'

				xco = i.location_id.split(" ")[0]
				yco = i.location_id.split(" ")[1]

			end
		
			if oldxco != false


				xdistance = xco - oldxco
				ydistance = yco - oldyco
				slope = xdistance/ydistance	

				y = 0
				while y < (ydistance).abs do

cost = Math.sqrt(1 + slope*slope)

avrgDistFromMiddle = (((yco + oldyco)/2 - 978).abs)*0.1251425314
mercaterDistFactor = -0.0003*avrgDistFromMiddle*avrgDistFromMiddle + 0.0281*avrgDistFromMiddle + 1.1574

cost = (cost*mercaterDistFactor)

totalLegCost = totalLegCost + cost
				y +=1
				end	
			end
			totalCost = totalLegCost + totalCost

			oldxco = xco
			oldyco = yco

		end

		return [totalCost*0.00003316794574, (totalCost*0.002)*(1/0.02)]

	end

	def initChessBoard(otherUserId)

		@battle.pieces.build(game_id: @game.id, user_id: @user.id, piece_type:"bishop" ,coordinates:"3,1",first_move: false ).save
		@battle.pieces.build(game_id: @game.id, user_id: @user.id, piece_type:"bishop" ,coordinates:"6,1" ,first_move: false).save		
		@battle.pieces.build(game_id: @game.id, user_id: @user.id, piece_type:"rook" ,coordinates:"1,1" ,first_move: false).save		
		@battle.pieces.build(game_id: @game.id, user_id: @user.id, piece_type:"rook" ,coordinates:"8,1" ,first_move: false).save		
		@battle.pieces.build(game_id: @game.id, user_id: @user.id, piece_type:"knight" ,coordinates:"2,1" ,first_move: false).save		
		@battle.pieces.build(game_id: @game.id, user_id: @user.id, piece_type:"knight" ,coordinates:"7,1" ,first_move: false).save		
		@battle.pieces.build(game_id: @game.id, user_id: @user.id, piece_type:"king" ,coordinates:"4,1" ,first_move: false).save		
		@battle.pieces.build(game_id: @game.id, user_id: @user.id, piece_type:"queen" ,coordinates:"5,1" ,first_move: false).save		
		@battle.pieces.build(game_id: @game.id, user_id: @user.id, piece_type:"pawn" ,coordinates:"1,2" ,first_move: false).save		
		@battle.pieces.build(game_id: @game.id, user_id: @user.id, piece_type:"pawn" ,coordinates:"2,2" ,first_move: false).save		
		@battle.pieces.build(game_id: @game.id, user_id: @user.id, piece_type:"pawn" ,coordinates:"3,2" ,first_move: false).save		
		@battle.pieces.build(game_id: @game.id, user_id: @user.id, piece_type:"pawn" ,coordinates:"4,2" ,first_move: false).save		
		@battle.pieces.build(game_id: @game.id, user_id: @user.id, piece_type:"pawn" ,coordinates:"5,2" ,first_move: false).save		
		@battle.pieces.build(game_id: @game.id, user_id: @user.id, piece_type:"pawn" ,coordinates:"6,2" ,first_move: false).save		
		@battle.pieces.build(game_id: @game.id, user_id: @user.id, piece_type:"pawn" ,coordinates:"7,2" ,first_move: false).save		
		@battle.pieces.build(game_id: @game.id, user_id: @user.id, piece_type:"pawn" ,coordinates:"8,2" ,first_move: false).save

		@battle.pieces.build(game_id: @game.id, user_id: otherUserId, piece_type:"bishop" ,coordinates:"3,8",first_move: false).save
		@battle.pieces.build(game_id: @game.id, user_id: otherUserId, piece_type:"bishop" ,coordinates:"6,8",first_move: false).save
		@battle.pieces.build(game_id: @game.id, user_id: otherUserId, piece_type:"rook" ,coordinates:"1,8",first_move: false).save
		@battle.pieces.build(game_id: @game.id, user_id: otherUserId, piece_type:"rook" ,coordinates:"8,8",first_move: false).save			
		@battle.pieces.build(game_id: @game.id, user_id: otherUserId, piece_type:"knight" ,coordinates:"2,8",first_move: false).save	
		@battle.pieces.build(game_id: @game.id, user_id: otherUserId, piece_type:"knight" ,coordinates:"7,8",first_move: false).save
		@battle.pieces.build(game_id: @game.id, user_id: otherUserId, piece_type:"king" ,coordinates:"4,8",first_move: false).save
		@battle.pieces.build(game_id: @game.id, user_id: otherUserId, piece_type:"queen" ,coordinates:"5,8",first_move: false).save
		@battle.pieces.build(game_id: @game.id, user_id: otherUserId, piece_type:"pawn" ,coordinates:"1,7" ,first_move: false).save
		@battle.pieces.build(game_id: @game.id, user_id: otherUserId, piece_type:"pawn" ,coordinates:"2,7" ,first_move: false).save
		@battle.pieces.build(game_id: @game.id, user_id: otherUserId, piece_type:"pawn" ,coordinates:"3,7" ,first_move: false).save
		@battle.pieces.build(game_id: @game.id, user_id: otherUserId, piece_type:"pawn" ,coordinates:"4,7" ,first_move: false).save
		@battle.pieces.build(game_id: @game.id, user_id: otherUserId, piece_type:"pawn" ,coordinates:"5,7" ,first_move: false).save
		@battle.pieces.build(game_id: @game.id, user_id: otherUserId, piece_type:"pawn" ,coordinates:"6,7" ,first_move: false).save
		@battle.pieces.build(game_id: @game.id, user_id: otherUserId, piece_type:"pawn" ,coordinates:"7,7" ,first_move: false).save
		@battle.pieces.build(game_id: @game.id, user_id: otherUserId, piece_type:"pawn" ,coordinates:"8,7" ,first_move: false).save	

	end
	def createBoardArray battle
		if battle.battle_type == "chess"
			boardArray = [["1_1",-1],["1_2",-1],["1_3",-1],["1_4",-1],["1_5",-1],["1_6",-1],["1_7",-1],["1_8",-1],["2_1",-1],["2_2",-1],["2_3",-1],["2_4",-1],["2_5",-1],["2_6",-1],["2_7",-1],["2_8",-1],["3_1",-1],["3_2",-1],["3_3",-1],["3_4",-1],["3_5",-1],["3_6",-1],["3_7",-1],["3_8",-1],["4_1",-1],["4_2",-1],["4_3",-1],["4_4",-1],["4_5",-1],["4_6",-1],["4_7",-1],["4_8",-1],["5_1",-1],["5_2",-1],["5_3",-1],["5_4",-1],["5_5",-1],["5_6",-1],["5_7",-1],["5_8",-1],["6_1",-1],["6_2",-1],["6_3",-1],["6_4",-1],["6_5",-1],["6_6",-1],["6_7",-1],["6_8",-1],["7_1",-1],["7_2",-1],["7_3",-1],["7_4",-1],["7_5",-1],["7_6",-1],["7_7",-1],["7_8",-1],["8_1",-1],["8_2",-1],["8_3",-1],["8_4",-1],["8_5",-1],["8_6",-1],["8_7",-1],["8_8",-1]]

			battle.pieces.each do |piece|

				boardArray[(piece.coordinates.split(",")[0].to_i - 1)*8 + (piece.coordinates.split(",")[1].to_i - 1)][1] = piece

			end
		else
			boardArray = Array.new

			battle.pieces.each do |piece|
				boardArray << piece
			end
		end
		return boardArray
	end

	def varifyMove (board,check, piece)

		possibleMoves = Array.new

		coordinates = [piece.coordinates.split("")[0].to_i - 1, piece.coordinates.split("")[2].to_i - 1]

		if piece.piece_type == "pawn"
			if board[((coordinates[0])*8) + coordinates[1] + 1][1]  == -1
				if board[((coordinates[0])*8) + coordinates[1] + 2][1]  == -1
				
					possibleMoves << [coordinates[0], (coordinates[1] + 2)]

				end
				possibleMoves << [coordinates[0], (coordinates[1] + 1)]
			end
			if board[((coordinates[0] + 1)*8) + coordinates[1] + 1][1] != -1
				if board[((coordinates[0] + 1)*8) + coordinates[1] + 1][1].user_id != @user.id
					possibleMoves << [(coordinates[0] + 1), (coordinates[1] + 1)]
				end
			elsif board[((coordinates[0] - 1)*8) + coordinates[1] + 1 ][1] != -1
				if board[((coordinates[0] - 1)*8) + coordinates[1] + 1][1].user_id != @user.id
					possibleMoves << [(coordinates[0] - 1), (coordinates[1] + 1)]
					end
			end


		elsif piece.piece_type == "knight"

			possibleMoves << [(coordinates[0] + 2), (coordinates[1] + 1)]
			possibleMoves << [(coordinates[0] - 2), (coordinates[1] - 1)]
			possibleMoves << [(coordinates[0] - 2), (coordinates[1] + 1)]
			possibleMoves << [(coordinates[0] + 2), (coordinates[1] - 1)]
			possibleMoves << [(coordinates[0] + 1), (coordinates[1] + 2)]
			possibleMoves << [(coordinates[0] - 1), (coordinates[1] - 2)]
			possibleMoves << [(coordinates[0] - 1), (coordinates[1] + 2)]
			possibleMoves << [(coordinates[0] + 1), (coordinates[1] - 2)]

		elsif piece.piece_type == "king"

			possibleMoves << [(coordinates[0] + 1), (coordinates[1] + 1)]
			possibleMoves << [(coordinates[0] - 1), (coordinates[1] - 1)]
			possibleMoves << [(coordinates[0] - 1), (coordinates[1] + 1)]
			possibleMoves << [(coordinates[0] + 1), (coordinates[1] - 1)]
			possibleMoves << [(coordinates[0] + 1), (coordinates[1] + 0)]
			possibleMoves << [(coordinates[0] - 1), (coordinates[1] - 0)]
			possibleMoves << [(coordinates[0] - 0), (coordinates[1] + 1)]
			possibleMoves << [(coordinates[0] + 0), (coordinates[1] - 1)]

		elsif piece.piece_type == "queen"

			block = false
			x = coordinates[0] + 1
			y = coordinates[1] + 1

			while x  < 8 && y  < 8 && block == false do
				if board[y*8 + x][1] == -1
					possibleMoves << [x, y]
				elsif
					possibleMoves  << [x, y]
					block = true
				end
				x  = x + 1
				y  = y + 1
			end

			block = false
			x = coordinates[0] - 1
			y = coordinates[1] - 1
			while x  > 0 && y  > 0 && block == false do
				if board[y*8 + x][1] == -1
					possibleMoves << [x, y]
				elsif
					possibleMoves << [x, y]
					block = true
				end
				x  = x - 1
				y  = y - 1
			end
			block = false
			x = coordinates[0] + 1
			y = coordinates[1] - 1
			while x  < 8 && y  > 0 && block == false do
				if board[y*8 + x][1] == -1
					possibleMoves << [x, y]
				elsif
					possibleMoves  << [x, y]
					block = true
				end
				x  = x + 1
				y  = y - 1
			end

			block = false
			x = coordinates[0] - 1
			y = coordinates[1] + 1
			while x  > 0 && y  < 8 && block == false do
				if board[y*8 + x][1] == -1
					possibleMoves << [x, y]
				elsif
					possibleMoves << [x, y]
					block = true
				end
				x  = x - 1
				y  = y + 1
			end


			block = false
			for i in (coordinates[0] + 1)..7 do
				if board[coordinates[1]*8 + i][1] == -1 && block == false
					possibleMoves << [i, coordinates[1]]
				elsif
					possibleMoves << [i, coordinates[1]]
					block = true
				end
			end
			block = false
logger.info coordinates[0] - 1
			for i in (coordinates[0] - 1)..0 do
logger.info i
				if board[coordinates[1]*8 + i][1] == -1 && block == false
					possibleMoves << [i, coordinates[1]]
				elsif
					possibleMoves << [i, coordinates[1]]
					block = true
				end
			end
			block = false
			for i in (coordinates[1] + 1)..7 do
				if board[i*8 + coordinates[0]][1] == -1 && block == false
					possibleMoves << [coordinates[0], i]
				elsif
					possibleMoves << [coordinates[0], i]
					block = true
				end
			end
			block = false
			for i in (coordinates[1] - 1)..0 do
				if board[i*8 + coordinates[0]][1] == -1 && block == false
					possibleMoves << [coordinates[0], i]
				elsif
					possibleMoves << [coordinates[0], i]
					block = true
				end
			end

		elsif piece.piece_type == "rook"

			block = false
			for i in (coordinates[0] + 1)..7 do
				if board[coordinates[1]*8 + i][1] == -1 && block == false
					possibleMoves << [i, coordinates[1]]
				elsif
					possibleMoves << [i, coordinates[1]]
					block = true
				end
			end
			block = false
			for i in (coordinates[0] - 1)..0 do
				if board[coordinates[1]*8 + i][1] == -1 && block == false
					possibleMoves << [i, coordinates[1]]
				elsif
					possibleMoves << [i, coordinates[1]]
					block = true
				end
			end
			block = false
			for i in (coordinates[1] + 1)..7 do
				if board[i*8 + coordinates[0]][1] == -1 && block == false
					possibleMoves << [coordinates[0], i]
				elsif
					possibleMoves << [coordinates[0], i]
					block = true
				end
			end
			block = false
			for i in (coordinates[1] - 1)..0 do
				if board[i*8 + coordinates[0]][1] == -1 && block == false
					possibleMoves << [coordinates[0], i]
				elsif
					possibleMoves << [coordinates[0], i]
					block = true
				end
			end

		elsif piece.piece_type == "bishop"


			block = false
			x = coordinates[0] + 1
			y = coordinates[1] + 1

			while x  < 8 && y  < 8 && block == false do
				if board[y*8 + x][1] == -1
					possibleMoves << [x, y]
				elsif
					possibleMoves  << [x, y]
					block = true
				end
				x  = x + 1
				y  = y + 1
			end

			block = false
			x = coordinates[0] - 1
			y = coordinates[1] - 1
			while x  > 0 && y  > 0 && block == false do
				if board[y*8 + x][1] == -1
					possibleMoves << [x, y]
				elsif
					possibleMoves << [x, y]
					block = true
				end
				x  = x - 1
				y  = y - 1
			end
			block = false
			x = coordinates[0] + 1
			y = coordinates[1] - 1
			while x  < 8 && y  > 0 && block == false do
				if board[y*8 + x][1] == -1
					possibleMoves << [x, y]
				elsif
					possibleMoves  << [x, y]
					block = true
				end
				x  = x + 1
				y  = y - 1
			end

			block = false
			x = coordinates[0] - 1
			y = coordinates[1] + 1
			while x  > 0 && y  < 8 && block == false do
				if board[y*8 + x][1] == -1
					possibleMoves << [x, y]
				elsif
					possibleMoves << [x, y]
					block = true
				end
				x  = x - 1
				y  = y + 1
			end


		end


		tempMoves = Array.new

		possibleMoves.each do |move|
			if (move[0] < 8 && move[1] < 8) && (move[0] > -1 && move[1] > -1)

				if board[move[0]*8 + move[1]][1] != -1
					if board[move[0]*8 + move[1]][1].user_id != @user.id
						tempMoves << move
					end
				else
					tempMoves << move
				end
			end
		end

		possibleMoves = tempMoves
=begin
		if check == true

			tempMoves = Array.new
			possibleMoves.each do |move|
				king = false
				kingCoordiantes = false

				tempBoard = board.clone

				tempBoard[coordinates[1]*8 + coordinates[0]][1] = -1
				tempBoard[move[0]*8 + move[1]][1] = -1

				tempBoard.each do |space| 

					if space[1] != -1

						if space[1].piece_type == "king" && space[1].user_id == @user.id

							king = space[1]

							kingCoordiantes = [space[0].split("_")[0].to_i,space[0].split("_")[1].to_i]
						end
					end
				end

				@valid = true

				testBoard = tempBoard.clone
				@testPiece = Piece.new(:piece_type => 'knight', :user_id => @user.id, :coordinates => king.coordinates)
				testBoard[kingCoordiantes[0] + kingCoordiantes[1]*8][1] = @testPiece
				varifyMove(testBoard,false, @testPiece).each do |testMove|
					if testBoard[testMove.split("")[0].to_i + testMove.split("")[0].to_i*8][1] != -1

						if testBoard[testMove.split("")[0].to_i + testMove.split("")[0].to_i*8][1].piece_type == "knight" && testBoard[testMove.split("")[0].to_i + testMove.split("")[0].to_i*8][1].user_id != @user.id
							@valid = -1
						end
					end
				end
				testBoard = tempBoard.clone
				@testPiece = Piece.new(:piece_type => 'pawn', :user_id => @user.id, :coordinates => king.coordinates)
				testBoard[kingCoordiantes[0] + kingCoordiantes[1]*8][1] = @testPiece
				varifyMove(testBoard,false, @testPiece).each do |testMove|
					if testBoard[testMove.split("")[0].to_i + testMove.split("")[0].to_i*8][1] != -1

						if testBoard[testMove.split("")[0].to_i + testMove.split("")[0].to_i*8][1].piece_type == "pawn" && testBoard[testMove.split("")[0].to_i + testMove.split("")[0].to_i*8][1].user_id != @user.id
							@valid = -1
						end
					end
				end
				testBoard = tempBoard.clone
				@testPiece = Piece.new(:piece_type => 'queen', :user_id => @user.id, :coordinates => king.coordinates)
				testBoard[kingCoordiantes[0] + kingCoordiantes[1]*8][1] = @testPiece
				varifyMove(testBoard,false, @testPiece).each do |testMove|
					if testBoard[testMove.split("")[0].to_i + testMove.split("")[0].to_i*8][1] != -1

						if testBoard[testMove.split("")[0].to_i + testMove.split("")[0].to_i*8][1].piece_type == "queen" && testBoard[testMove.split("")[0].to_i + testMove.split("")[0].to_i*8][1].user_id != @user.id

							@valid = -1
						end
					end
				end
				testBoard = tempBoard.clone
				@testPiece = Piece.new(:piece_type => 'rook', :user_id => @user.id, :coordinates => king.coordinates)
				testBoard[kingCoordiantes[0] + kingCoordiantes[1]*8][1] = @testPiece
				varifyMove(testBoard,false, @testPiece).each do |testMove|

					if testBoard[testMove.split("")[0].to_i + testMove.split("")[0].to_i*8][1] != -1
						if testBoard[testMove.split("")[0].to_i + testMove.split("")[0].to_i*8][1].piece_type == "rook" && testBoard[testMove.split("")[0].to_i + testMove.split("")[0].to_i*8][1].user_id != @user.id

							@valid = -1
						end
					end
				end
				testBoard = tempBoard.clone
				@testPiece = Piece.new(:piece_type => 'bishop', :user_id => @user.id, :coordinates => king.coordinates)
				testBoard[kingCoordiantes[0] + kingCoordiantes[1]*8][1] = @testPiece
				varifyMove(testBoard,false, @testPiece).each do |testMove|
					if testBoard[testMove.split("")[0].to_i + testMove.split("")[0].to_i*8][1] != -1

						if testBoard[testMove.split("")[0].to_i + testMove.split("")[0].to_i*8][1].piece_type == "bishop" && testBoard[testMove.split("")[0].to_i + testMove.split("")[0].to_i*8][1].user_id != @user.id
							@valid = -1
						end
					end
				end
				testBoard = tempBoard.clone
				@testPiece = Piece.new(:piece_type => 'king', :user_id => @user.id, :coordinates => king.coordinates)
				testBoard[kingCoordiantes[0] + kingCoordiantes[1]*8][1] = @testPiece
				varifyMove(testBoard,false, @testPiece).each do |testMove|
					if testBoard[testMove.split("")[0].to_i + testMove.split("")[0].to_i*8][1] != -1

						if testBoard[testMove.split("")[0].to_i + testMove.split("")[0].to_i*8][1].piece_type == "king" && testBoard[testMove.split("")[0].to_i + testMove.split("")[0].to_i*8][1].user_id != @user.id
							@valid = -1
						end
					end
				end

				if @valid == true
					tempMoves << move
				end
			end

			possibleMoves = tempMoves

			tempMoves = Array.new

			possibleMoves.each do |move|
				tempMoves << ((move[0] + 1).to_s + (move[1] + 1).to_s)
			end
			possibleMoves = tempMoves
		else


			tempMoves = Array.new

			possibleMoves.each do |move|
				tempMoves << (move[0].to_s + move[1].to_s)
			end
			possibleMoves = tempMoves
		end
=end
		return possibleMoves
	end

end




