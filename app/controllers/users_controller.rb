class UsersController < ApplicationController

	respond_to :html, :json
	helper UsersHelper

	$territoryStats = Hash[[["Central_America",[81297103,16714766457,20726392710,2502977002208.47,202155631,690879757,6852777556,91525073,91525073]],
["Central_Asia",[155384433,35988418317,83779005510,2247507961843.90,387290981,2792633517,6153341442,197061839,197061839]],
["Central_South_America",[37200326,6677174880,27564457920,1087019538072.58,92327168,918815264,2976097298,36562217,36562217]],
["China",[618588627,50323725693,28926563400,13285787244911.30,1355692576,964218780,36374503066,275557704,275557704]],
["Coastal_Africa",[77477870,26055103454,22508101440,765220921997.21,307365566,750270048,2095060704,142669971,142669971]],
["Coastal_South_America",[25359324,18573083033,5112103260,1187231066998.67,63721240,170403442,3250461511,101700660,101700660]],
["Congo",[26000754,5957381818,15051875580,117302877498.48,106462255,501729186,485428822.7,32620845,32620845]],
["East_Africa",[86097678,27718974627,1717191630,508253419401.14,331977057,57239721,1391522024,151780833,151780833]],
["Eastern_Canada",[8889448,7532655439,10555145280,1129478395142.65,24182430,351838176,3092343313,41246628,41246628]],
["Eastern_South_America",[86678546,34229214368,18291898800,2497733382801.79,209360648,609729960,6838421308,187428963,187428963]],
["Egypt",[38275459,2083093435,15183516600,644066819600.90,93139273,506117220,1763358849,11406398,11406398]],
["Greenland",[22164,404096,404096,2216755200.29,57728,0,6069144.97,0,0]],
["Iceland",[124292,55311634,2221457,12916185701.65,317351,0,35362589.19,302870,302870]],
["India",[489571520,71011854230,6824656440,4945378524000.15,1236344631,227488548,13539708485,388839722,388839722]],
["Indonesia",[107538660,10605834378,6715070460,1318770143599.43,253609653,223835682,3610595876,58074384,58074384]],
["Madagascar",[7072251,1578874576,162413482,23201925999.24,23201926,0,63523411.36,8645446,8645446]],
["Middle_East",[76503157,12973726935,1.09249E+11,2546297402807.80,186576152,3641644074,6971382349,71040257,71040257]],
["Mongolia",[1482827,275283629,20672330,17423821000.11,2953190,9935,47703822.04,1507371,1507371]],
["New_Zealand",[3986518,340975850,521601720,153592634699.60,11060327,17386724,420513715.8,1867082,1867082]],
["Non_Contiguous_United_States",[806288,12705926913,13488579060,112949020798.88,2139186,449619302,309237565.5,69573864,69573864]],
["Northeastern_United_States",[46716048,11514022111,12223256100,6544223611119.12,123943629,407441870,17917107765,63047349,63047349]],
["Northern_Australia",[1930962,9099989348,1481922690,2262311720000.98,5261189,49397423,6193870691,49828826,49828826]],
["Northern_Europe",[74547714,17595660153,16679654700,6628345168327.97,197231231,555988490,18147420036,96348584,96348584]],
["Northwestern_United_States",[13178136,19401372146,20596446360,1845361055999.08,34950020,686548212,5052323220,106236124,106236124]],
["Pacific_Asia",[74335175,3569353394,933893100,6393300194301.43,200995001,31129770,17503901969,19544714,19544714]],
["Russia",[45614734,54859776583,71954568000,2578711923199.98,142170272,2398485600,7060128469,300395765,300395765]],
["Sahara",[53283581,23103538658,13431943920,416097725998.91,150509355,447731464,1139213487,126508083,126508083]],
["Southeastern_Asia",[110955679,18153056307,11034622410,1726662767601.70,269244873,367820747,4727345017,99400719,99400719]],
["Southeastern_United_States",[22042865,6740904613,7149685680,3087878745600.20,58482552,238322856,8454151254,36911182,36911182]],
["Southern_African_Territory",[28549879,11859924271,1249656480,686308887398.60,109196836,41655216,1879011328,64941406,64941406]],
["Southern_Australia",[6548092,12869716336,2095818330,766775999998.54,17832000,69860611,2099318275,70470726,70470726]],
["Southern_Europe",[57254748,15742960026,2184620640,3467461864798.82,147836437,72820688,9493393196,86203751,86203751]],
["Southwestern_United_States",[36091747,21593425134,23087134410,5040822177601.79,95470117,769571147,13801018967,118239152,118239152]],
["Ukraine",[22097364,18956641189,920666970,631207950700.72,44291413,30688899,1728153185,103800910,103800910]],
["United_Kingdom",[24035131,2735132987,5319399960,2377613042100.35,64100000,177313332,6509549739,14976772,14976772]],
["Western_Europe",[46589119,15856182778,736362660,404999555109.76,124810787,24545422,11088283507,86823725,86823725]],
["Western_Canada",[3365026,11433492339,16022865270,574295515259.63,9154054,534095509,1572335429,62606392,62606392]],
["Western_South_America",[16129267,3363130688,1458389520,393115251498.94,40779421,48612984,1076290901,18415500,18415500]]]]


	$empireDistribution = [["Central_America",[2,3,4,5,6,7,8,9,10]],
["Central_Asia",[1,1,2,1,2,3,3,3,2]],
["Central_South_America",[2,3,4,5,6,7,8,7,10]],
["China",[1,1,1,1,1,1,1,1,1]],
["Coastal_Africa",[2,3,2,5,6,7,5,7,5]],
["Coastal_South_America",[2,3,4,5,6,7,8,7,10]],
["Congo",[2,3,2,5,6,3,5,7,5]],
["East_Africa",[2,3,2,2,2,3,3,7,5]],
["Eastern_Canada",[2,2,3,4,4,5,5,8,8]],
["Eastern_South_America",[2,3,4,5,6,7,8,7,10]],
["Egypt",[2,2,2,2,6,3,5,7,5]],
["Greenland",[2,2,3,3,4,5,5,8,8]],
["Iceland",[2,2,3,3,4,4,5,8,7]],
["India",[1,1,2,2,2,1,3,2,4]],
["Indonesia",[1,1,2,2,2,1,3,4,4]],
["Madagascar",[2,3,2,2,2,3,3,9,5]],
["Middle_East",[1,1,2,2,2,3,3,3,4]],
["Mongolia",[1,1,1,1,1,1,1,3,2]],
["New_Zealand",[1,3,2,2,2,1,3,4,4]],
["Non_Contiguous_United_States",[2,2,3,4,4,5,6,4,4]],
["Northeastern_United_States",[2,3,3,4,5,6,7,8,9]],
["Northern_Australia",[1,3,2,2,2,1,3,4,4]],
["Northern_Europe",[1,2,2,3,3,4,4,5,6]],
["Northwestern_United_States",[2,2,3,5,4,5,6,8,8]],
["Pacific_Asia",[1,1,1,2,2,2,2,2,3]],
["Russia",[1,1,1,1,1,2,2,3,2]],
["Sahara",[2,2,2,3,3,3,5,7,5]],
["Southeastern_Asia",[1,1,2,2,2,1,3,2,3]],
["Southeastern_United_States",[2,3,4,4,5,6,7,9,9]],
["Southern_African_Territory",[2,3,2,5,6,3,5,7,5]],
["Southern_Australia",[1,3,2,2,2,3,3,4,4]],
["Southern_Europe",[1,2,2,2,3,3,3,6,5]],
["Southwestern_United_States",[2,3,4,5,5,7,6,9,8]],
["Ukraine",[1,1,2,1,3,3,4,3,2]],
["United_Kingdom",[2,2,3,3,4,4,5,5,7]],
["Western_Europe",[2,2,3,3,4,5,5,6,7]],
["Western_Canada",[2,2,3,4,4,5,6,8,4]],
["Western_South_America",[2,3,4,5,6,7,8,7,10]]]
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
		if signed_in?

			User.update_stats
			@user = User.find(params[:id])
			if Game.find_by_id(@user.game_id).nil? != true
				@gameAttribute = GameAttribute.where(game_id: @user.game_id)

				@game = Game.find(@user.game_id)

				@battles = Array.new
		
				@game.battles.each do |battle|
				if battle.user_one_id == @gameAttribute.id || battle.user_two_id == @gameAttribute.id
						@battles << battle
					end
				end

				@battles.each_with_index do |battle, index|
					@battles[index] = [@battles[index],createBoardArray(battle)]
				end

				@locations = @game.locations.where(:kindType => "fort")#.where("active_date > ?", Date.today)
				@locations = @locations + @game.locations.where(:kindType => "camp",:user_id => @user.id)#.where("active_date > ?", Date.today)

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
				@territoryColors = Hash.new

				@game.attributes.each do |attr_name, attr_value|
					if attr_name != "id" && attr_name != "created_at" && attr_name != "updated_at" && attr_name != "name" && attr_name != "players"&& attr_name != "start_date" && attr_name != "start_status" && attr_name != "user_id" && attr_name != "private" && attr_name != "invitation" && attr_value.instance_of?(NilClass) != true
						if GameAttribute.find(attr_value).color.instance_of?(NilClass) != true

							colorUser = GameAttribute.find(attr_value)
							@territoryOwners << Array.new
							@territoryOwners[@territoryOwners.length - 1] << colorUser.user_id
							@territoryOwners[@territoryOwners.length - 1] << User.find(colorUser.user_id).username
							@territoryOwners[@territoryOwners.length - 1] << attr_name.gsub(/\_owner_id\b/, '')

							@territoryColors[attr_name.gsub("_owner_id","")] = Array.new
							@territoryColors[attr_name.gsub("_owner_id","")] << colorUser.color[1,2].insert(0, "0x").hex
							@territoryColors[attr_name.gsub("_owner_id","")] << colorUser.color[3,2].insert(0, "0x").hex
							@territoryColors[attr_name.gsub("_owner_id","")] << colorUser.color[5,2].insert(0, "0x").hex
						end
					end
				end
			else
				redirect_to edit_user_url(@user.id)
			end
		else
			redirect_to root_path
		end
	end	
	




	def edit
		if signed_in?
			@user = User.find(params[:id])
			@currentGameAttributes = @user.game_attributes.where(status: "t")

			@user.game_attributes.where(status: "f").each do |attribute|
				if Date.today >= Game.find(attribute.game_id).start_date && Game.find(attribute.game_id).game_attributes.length > 1
					@currentGameAttributes << attribute
					@startingGame = Game.find(attribute.game_id)
					@startingGame.start_status = true
					@startingGame.locations.build(:name=> "Fort Mexico City",  :xco => "177", :yco=> "128", :territory => "#central_america", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Tehran",  :xco => "88", :yco=> "227", :territory => "#central_asia", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Bogota",  :xco => "75", :yco=> "82", :territory => "#central_south_america", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Shanghai",  :xco => "471", :yco=> "254", :territory => "#china", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Yamoussoukro",  :xco => "125", :yco=> "115", :territory => "#coastal_africa", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Buenos Aires",  :xco => "153", :yco=> "187", :territory => "#coastal_south_america", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Kinshasa",  :xco => "51", :yco=> "197", :territory => "#congo", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Nairobi",  :xco => "142", :yco=> "288", :territory => "#east_africa", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Toronto",  :xco => "466", :yco=> "442", :territory => "#eastern_canada", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Rio de Janeiro",  :xco => "302", :yco=> "317", :territory => "#eastern_south_america", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Cairo",  :xco => "206", :yco=> "45", :territory => "#egypt", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Nuuk",  :xco => "218", :yco=> "224", :territory => "#greenland", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Reykjavik",  :xco => "24", :yco=> "24", :territory => "#iceland", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Mumbai",  :xco => "46", :yco=> "140", :territory => "#india", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Jakarta",  :xco => "114", :yco=> "131", :territory => "#indonesia", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Antananarivo",  :xco => "45", :yco=> "73", :territory => "#madagascar", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Jerusalem",  :xco => "90", :yco=> "129", :territory => "#middle_east", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Ulaanbaatar",  :xco => "186", :yco=> "42", :territory => "#mongolia", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Aukland",  :xco => "339", :yco=> "400", :territory => "#new_zealand", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Anchorage",  :xco => "174", :yco=> "115", :territory => "#non_contiguous_united_states", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort New York",  :xco => "209", :yco=> "86", :territory => "#northeastern_united_states", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Brisbane",  :xco => "260", :yco=> "203", :territory => "#northern_australia", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Berlin",  :xco => "76", :yco=> "-128", :territory => "#northern_europe", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Seattle",  :xco => "1009", :yco=> "9", :territory => "#northwestern_united_states", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Tokyo",  :xco => "138", :yco=> "90", :territory => "#pacific_asia", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort St. Petersburg",  :xco => "12", :yco=> "241", :territory => "#russia", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Tunis",  :xco => "270", :yco=> "1", :territory => "#sahara", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Bangkok",  :xco => "198", :yco=> "191", :territory => "#southeastern_asia", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Maimi",  :xco => "130", :yco=> "132", :territory => "#southeastern_united_states", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Johannesburg",  :xco => "165", :yco=> "193", :territory => "#southern_african_territory", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Melbourne",  :xco => "370", :yco=> "230", :territory => "#southern_australia", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Rome",  :xco => "52", :yco=> "73", :territory => "#southern_europe", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Los Angeles",  :xco => "64", :yco=> "107", :territory => "#southwestern_united_states", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Kiev",  :xco => "278", :yco=> "250", :territory => "#ukraine", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort London",  :xco => "101", :yco=> "86", :territory => "#united_kingdom", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Paris",  :xco => "116", :yco=> "29", :territory => "#western_europe", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Vancouver",  :xco => "166", :yco=> "243", :territory => "#western_canada", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.locations.build(:name=> "Fort Lima",  :xco => "47", :yco=> "147", :territory => "#western_south_america", :capital => true, :active => true, :kindType => "fort").save
					@startingGame.game_attributes.each do |attribute|
						attribute.status = true
						array = [*1..@startingGame.game_attributes.length]
						takenarray = Array.new

						@startingGame.game_attributes.each do |attribute|

							takenarray << attribute.place
						end
						array = array - takenarray
						attribute.place = array[(rand*(array.length - 1)).round]

						@territories = Array.new
						$empireDistribution.each do |territory|
								if territory[1][@startingGame.game_attributes.length - 2] == attribute.place
									@territories << territory[0]
								end
						end
						@territories.each do |territory|
logger.info territory.downcase + "_owner_id"
							@startingGame[territory.downcase + "_owner_id"] = attribute.id
							@currentLocation = @startingGame.locations.find_by_territory("#" + territory.downcase)
logger.info @currentLocation
							@currentLocation.energy_units = $territoryStats[territory][2].to_s
							@currentLocation.food_units = $territoryStats[territory][1].to_s
							@currentLocation.money = $territoryStats[territory][3].to_s
							@currentLocation.population = $territoryStats[territory][4].to_s
							@currentLocation.militants = $territoryStats[territory][0].to_s
							@currentLocation.user_id = attribute.user_id
							@currentLocation.save


						end
						attribute.save
					end
					@startingGame.save
				elsif Date.today >= Game.find(attribute.game_id).start_date
					Game.find(attribute.game_id).game_attributes.destroy()
					Game.find(attribute.game_id).destroy()
				end
			
			end

			@currentGames = Array.new
			@conflictGames = Array.new

			@currentGameAttributes.each do |attribute|

					@currentGames << Game.find(attribute.game_id)
			end
	 		@user.game_attributes.where(status: "f").each do |attribute|
				@conflictGames << Game.find(attribute.game_id)
			end

			@games = Game.where(start_status: "f", private: "F")
			Game.where(private: "T").each do |game|
				game.invitation.split(",").each do |id|
					if id.to_i == @user.id 
						@games << game
					end
				end
			end
			@games = @games - @conflictGames
		else
			redirect_to root_path
		end
	end

# All the logic happens here - Do touch

  def update

    @user = User.find(params[:id])

	if  user_params[:locations_attributes] != nil
		if user_params[:locations_attributes][:"100000000000"] != nil
			@game = Game.find(@user.game_id)
			@location = @user.locations.build(user_params[:locations_attributes][:"100000000000"])
			@location.game_id = @user.game_id
			@location.capital = false
			valid = true

			if @location.kindType == "fort"
				if @user.game_attributes.find_by_game_id(@user.game_id).id.to_s != Game.find(@user.game_id)[@location.territory.gsub("#","") + "_owner_id"].to_s
					valid = false
				end
				if Location.find_by_id(@location.sponsor_location_id).money.to_i >= 1553000000
					sponsorLocation = Location.find_by_id(@location.sponsor_location_id)
					sponsorLocation.money = (sponsorLocation.money.to_i - 1553000000).to_s
					sponsorLocation.save
				else
					valid = false
				end
				@location.active_date = 60.days.from_now
			elsif @location.kindType == "camp"
				if Location.find_by_id(@location.sponsor_location_id).money.to_i >= 100000000
					sponsorLocation = Location.find_by_id(@location.sponsor_location_id)
					sponsorLocation.money = (sponsorLocation.money.to_i - 100000000).to_s
					sponsorLocation.save
				else 
					valid = false
				end
				@location.active_date = 1.days.from_now
			end

			@location.active = false
			respond_to do |format|
				if valid == true
					if @location.save
						format.html { redirect_to @user, notice: 'Fort was successfully created.' }
						format.js   {}
						format.json { render json: @location, status: :updated, location: @user }
						else
						format.html { render action: "show" }
						format.json { render json: @user.errors, status: :unprocessable_entity }
					end
				else
					format.html { render action: "show" }
					format.json { render json: @user.errors, status: :unprocessable_entity }
				end
			end

		end
	elsif  user_params[:trades_attributes] != nil
		if user_params[:trades_attributes][:"100000000000"] != nil
			@trade = Trade.build(user_params[:trades_attributes][:"100000000000"])
			@notifications = Array.new
			@game = Game.find(@user.game_id)
			@game << @trade

			y = "100000000000"
			while user_params[:trades_attributes][:"100000000000"][:legs_attributes][y] != nil do
				@leg = @trade.legs.build(user_params[:trades_attributes][:"100000000000"][:legs_attributes][y])
				if y == "100000000000"
					@trade.sending_location_id = @leg.location_id 
					#if Location.find(@leg.location_id).user_id != @user.id
					#	@notifications << Notification.new(message:"")
					#end
				end
				y = (y.to_i + 1).to_s
			end
			@trade.recipient_location_id = @leg.location_id 

			valid = true
			if Location.find(@trade.sending_location_id)[@trade.what] < @trade.quantity
				valid = false
			end
			if Location.find(@trade.sending_location_id).user_id != @user.id
				valid = false
			end

			if valid = true
				if @trade.save
					format.html { redirect_to @user, notice: 'Fort was successfully created.' }
					format.js   {}
					format.json { render json: @trade, status: :updated, location: @user }
				else
					format.html { render action: "show" }
					format.json { render json: @user.errors, status: :unprocessable_entity }
				end
			else
				format.html { render action: "show" }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end

		end
	elsif user_params[:game_id] == "new"

		@game = @user.games.build(user_params[:games_attributes])
		if @game.valid?

			@invitedUsers = Array.new
			@game.invitation.split(",").each do |username|
				if User.find_by_username(username.downcase)
					@invitedUsers << User.find_by_username(username.downcase).id	
				end
			end
			@game.invitation =  @invitedUsers.to_s.gsub("[","").gsub("]","").gsub(" ","")

			@game.start_status = false

			@gameAttribute = @game.game_attributes.build(:color => user_params[:color],:status => false)
			@user.game_attributes << @gameAttribute

			@game.save
		end
			redirect_to edit_user_url(@user.id)

	elsif GameAttribute.where(:game_id => user_params[:game_id], :user_id => @user.id).length < 1
		@game = Game.find(user_params[:game_id])
		if @game.game_attributes.length < @game.players
			valid = true
			if @game.private == "T"
				valid = false
				@game.invitation.split(",").each do |id|
					if id.to_i == @user.id 
						valid = true
					end
				end
			end

			if valid == true

				@gameAttribute = @game.game_attributes.build(:color => user_params[:color],:status => false)
				@user.game_attributes << @gameAttribute
				@gameAttribute.save
			end
		end
		redirect_to edit_user_url(@user.id)
	else
		@user.game_id = user_params[:game_id]
		@user.save
		redirect_to @user
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

        params.require(:user).permit(:name, :email, :username, :password, :password_confirmation, :game_id, :color, locations_attributes: [ :kindType, :name, :xco, :yco, :territory, :id, :active_date, :game_id, :sponsor_location_id], pieces_attributes: [ :coordinates, :id], battles_attributes:[:user_two_id, :location_two_id, :location_two_type, :location_one_type, :location_one_id, :battle_type, :type ],games_attributes: [:game_id, :name, :private, :players, :start_date, :invitation],trades_attributes: [:cost, :sending_location_id, :recipient_location_id, :what, :quantity, :forwhat, :forquantity, :notes, legs_attributes: [:location_id, :trade_index]])

   		end


def calculateTradeCost(itinerary)
		colors = [["central_america", [0xe5,0x42,0x42], [488,780] ,[0.311006362]],
	["central_asia",[0xf1,0x71,0x71], [2054,526] ,[0.284473688]],
	[" central_south_america",[0xfb,0x07,0x07], [822,1020],[0.402101331]], 
	["china",[0xfb,0x07,0xca], [2342,542] ,[0.073106002]], 
	["coastal_africa",[0xd0,0x2e,0xb0], [1436,959] ,[0.653478724]], 
	["coastal_south_america",[0xc4,0x56,0xae], [908,1340] ,[1.025283875]],
	[" congo",[0x87,0x13,0x70], [1720,1015] ,[4.093718719]], 
	["east_africa",[0x96,0x0e,0xbd], [1844,887] ,[3.45647866]], 
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




