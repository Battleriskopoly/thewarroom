require 'eventmachine'

class User < ActiveRecord::Base

  belongs_to :game

  has_many :locations
  accepts_nested_attributes_for :locations

  has_many :trades
  accepts_nested_attributes_for :trades

  has_many :trade_proposals
  accepts_nested_attributes_for :trade_proposals

  has_many :game_attributes
  accepts_nested_attributes_for :game_attributes

  has_many :games
  accepts_nested_attributes_for :games

  has_many :legs
  accepts_nested_attributes_for :legs

  has_many :chesses
  accepts_nested_attributes_for :chesses

  has_many :pieces
  accepts_nested_attributes_for :pieces

  has_many :battles
  accepts_nested_attributes_for :battles

  before_save { self.email = email.downcase }
  before_save { self.username = username.downcase }
  before_create :create_remember_token
  validates :username, presence: true, length: { maximum: 50 }, on: :create
  validates :name, presence: true, length: { maximum: 50 }, on: :create
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }, on: :create
  has_secure_password
  validates :password, length: { minimum: 6 }, on: :create

  $commencementValues = Hash[[["Central_America",[6852777556,91525073.00,690879757.00]],
["Central_Asia",[6153341442,197061839.00,2792633517.00]],
["Central_South_America",[2976097298,36562217.00,918815264.00]],
["China",[36374503066,275557704.00,964218780.00]],
["Coastal_Africa",[2095060704,142669971.00,750270048.00]],
["Coastal_South_America",[3250461511,101700660.00,170403442.00]],
["Congo",[485428822.7,32620845.00,501729186.00]],
["East_Africa",[1391522024,151780833.00,57239721.00]],
["Eastern_Canada",[3092343313,41246628.00,351838176.00]],
["Eastern_South_America",[6838421308,187428963.00,609729960.00]],
["Egypt",[1763358849,11406398.00,506117220.00]],
["Greenland",[6069144.97,0.00,0.00]],
["Iceland",[35362589.19,302870.00,0.00]],
["India",[13539708485,388839722.00,227488548.00]],
["Indonesia",[3610595876,58074384.00,223835682.00]],
["Madagascar",[63523411.36,8645446.00,0.00]],
["Middle_East",[6971382349,71040257.00,3641644074.00]],
["Mongolia",[47703822.04,1507371.00,9935.00]],
["New_Zealand",[420513715.8,1867082.00,17386724.00]],
["Non_Contiguous_United_States",[309237565.5,69573864.00,449619302.00]],
["Northeastern_United_States",[17917107765,63047349.00,407441870.00]],
["Northern_Australia",[619387069.1,49828826.00,49397423.00]],
["Northern_Europe",[18147420036,96348584.00,555988490.00]],
["Northwestern_United_States",[5052323220,106236124.00,686548212.00]],
["Pacific_Asia",[17503901969,19544714.00,31129770.00]],
["Russia",[7060128469,300395765.00,2398485600.00]],
["Sahara",[1139213487,126508083.00,447731464.00]],
["Southeastern_Asia",[4727345017,99400719.00,367820747.00]],
["Southeastern_United_States",[8454151254,36911182.00,238322856.00]],
["Southern_African_Territory",[1879011328,64941406.00,41655216.00]],
["Southern_Australia",[2099318275,70470726.00,69860611.00]],
["Southern_Europe",[9493393196,86203751.00,72820688.00]],
["Southwestern_United_States",[13801018967,118239152.00,769571147.00]],
["Ukraine",[1728153185,103800910.00,30688899.00]],
["United_Kingdom",[6509549739,14976772.00,177313332.00]],
["Western_Europe",[11088283507,86823725.00,24545422.00]],
["Western_Canada",[1170620426,62606392.00,534095509.00]],
["Western_South_America",[1076290901,18415500.00,48612984.00]]]]
	def User.update_stats
EM.run {

    		client = Faye::Client.new('ws://localhost:3000/faye')
		self.all.each do |user|
			user.locations.each do |location|
				if location.capital == true
					logger.info location.territory.gsub("#","").split("_").map { |i| i.capitalize }.join('_')
					location.money = (location.money.to_i + $commencementValues[location.territory.gsub("#","").split("_").map { |i| i.capitalize }.join('_')][0]).to_s
					location.food_units = (location.food_units.to_i + $commencementValues[location.territory.gsub("#","").split("_").map { |i| i.capitalize }.join('_')][1]).to_s
					location.energy_units = (location.energy_units.to_i + $commencementValues[location.territory.gsub("#","").split("_").map { |i| i.capitalize }.join('_')][2]).to_s
					if location.population.to_i > location.energy_units.to_i
						location.population = ((location.energy.to_i - location.energy_units.to_i)/10).round
					elsif location.population.to_i > location.food_units.to_i
							location.population = ((location.population.to_i - location.food_units.to_i)/10).round
					end
					location.save
					thisuser = User.find(location.user_id)
logger.info '{name:"' +  location.name + '", territory:"' +  location.territory + '", xco:' + location.xco.to_s + ', yco:' + location.yco.to_s  + ', id:' + location.id.to_s + ', owner_id:' + location.user_id.to_s + ', kind:"' +  location.kindType + '", capital:"' +  location.capital.to_s + '", money:"' +  location.money + '", food_units:"' +  location.food_units + '", energy_units:"' +  location.energy_units + '", population:"' +  location.population + '", militants:"' +  location.militants + '",active:"' +  location.active.to_s + '"}'
    					client.publish('/' + thisuser.game_attributes.find_by_game_id(location.game_id).id.to_s, 'text' => 'parseResponseObject("midnight",{name:"' +  location.name + '", territory:"' +  location.territory + '", xco:' + location.xco.to_s + ', yco:' + location.yco.to_s  + ', id:' + location.id.to_s + ', owner_id:' + location.user_id.to_s + ', kind:"' +  location.kindType + '", capital:"' +  location.capital.to_s + '", money:"' +  location.money + '", food_units:"' +  location.food_units + '", energy_units:"' +  location.energy_units + '", population:"' +  location.population + '", militants:"' +  location.militants + '",active:"' +  location.active.to_s + '"})')
				end
			end
		end
	}
	end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
