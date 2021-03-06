class ChangeIntToString < ActiveRecord::Migration
  def change
 remove_column :games, :central_america_owner_id
 remove_column :games, :central_asia_owner_id
 remove_column :games, :central_south_america_owner_id
 remove_column :games, :china_owner_id
 remove_column :games, :coastal_africa_owner_id
 remove_column :games, :coastal_south_america_owner_id
 remove_column :games, :congo_owner_id
 remove_column :games, :east_africa_owner_id
 remove_column :games, :eastern_canada_owner_id
 remove_column :games, :eastern_south_america_owner_id
 remove_column :games, :egypt_owner_id
 remove_column :games, :greenland_owner_id
 remove_column :games, :iceland_owner_id
 remove_column :games, :india_owner_id
 remove_column :games, :indonesia_owner_id
 remove_column :games, :madagascar_owner_id
 remove_column :games, :middle_east_owner_id
 remove_column :games, :mongolia_owner_id
 remove_column :games, :non_contiguous_united_states_owner_id
 remove_column :games, :northeastern_united_states_owner_id
 remove_column :games, :northern_australia_owner_id
 remove_column :games, :northern_europe_owner_id
 remove_column :games, :northwestern_united_states_owner_id
 remove_column :games, :pacific_asia_owner_id
 remove_column :games, :papua_new_guinea_owner_id
 remove_column :games, :russia_owner_id
 remove_column :games, :sahara_owner_id
 remove_column :games, :southeastern_asia_owner_id
 remove_column :games, :southeastern_united_states_owner_id
 remove_column :games, :southern_african_territory_owner_id
 remove_column :games, :southern_australia_owner_id
 remove_column :games, :southern_europe_owner_id
 remove_column :games, :southwestern_united_states_owner_id
 remove_column :games, :ukraine_owner_id
 remove_column :games, :united_kingdom_owner_id
 remove_column :games, :western_europe_owner_id
 remove_column :games, :western_canada_owner_id
 remove_column :games, :western_south_america_owner_id
 add_column :games, :central_america_owner_id, :string
 add_column :games, :central_asia_owner_id, :string
 add_column :games, :central_south_america_owner_id, :string
 add_column :games, :china_owner_id, :string
 add_column :games, :coastal_africa_owner_id, :string
 add_column :games, :coastal_south_america_owner_id, :string
 add_column :games, :congo_owner_id, :string
 add_column :games, :east_africa_owner_id, :string
 add_column :games, :eastern_canada_owner_id, :string
 add_column :games, :eastern_south_america_owner_id, :string
 add_column :games, :egypt_owner_id, :string
 add_column :games, :greenland_owner_id, :string
 add_column :games, :iceland_owner_id, :string
 add_column :games, :india_owner_id, :string
 add_column :games, :indonesia_owner_id, :string
 add_column :games, :madagascar_owner_id, :string
 add_column :games, :middle_east_owner_id, :string
 add_column :games, :mongolia_owner_id, :string
 add_column :games, :non_contiguous_united_states_owner_id, :string
 add_column :games, :northeastern_united_states_owner_id, :string
 add_column :games, :northern_australia_owner_id, :string
 add_column :games, :northern_europe_owner_id, :string
 add_column :games, :northwestern_united_states_owner_id, :string
 add_column :games, :pacific_asia_owner_id, :string
 add_column :games, :papua_new_guinea_owner_id, :string
 add_column :games, :russia_owner_id, :string
 add_column :games, :sahara_owner_id, :string
 add_column :games, :southeastern_asia_owner_id, :string
 add_column :games, :southeastern_united_states_owner_id, :string
 add_column :games, :southern_african_territory_owner_id, :string
 add_column :games, :southern_australia_owner_id, :string
 add_column :games, :southern_europe_owner_id, :string
 add_column :games, :southwestern_united_states_owner_id, :string
 add_column :games, :ukraine_owner_id, :string
 add_column :games, :united_kingdom_owner_id, :string
 add_column :games, :western_europe_owner_id, :string
 add_column :games, :western_canada_owner_id, :string
 add_column :games, :western_south_america_owner_id, :string
  end
end
