module UsersHelper

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

		oldxco
		oldyco

		totalCost

		itinerary.each do |i|

			totalLegCost

			xco
			yco

			if i.location_type = "encampment"
				encampment =  Encampment.find(i.location_id)
				xco = encampment.xco
				yco = encampment.yco

				colors.each_with_index do |f,index|
						
					if colors[index][0] == encampment.territory.gsub("#","") 
						xco = xco + colors[index][2][0]
						yco = yco + colors[index][2][1]
					end
				end

			elsif i.location_type = "fort"

				fort =  Fort.find(i.location_id)
				xco = fort.xco
				yco = fort.yco

				colors.each_with_index do |f,index|
						
					if colors[index][0] == fort.territory.gsub("#","") 
						xco = xco + colors[index][2][0]
						yco = yco + colors[index][2][1]
					end
				end

			elsif i.location_type = "seapoint"

				xco = i.location_id.split(" ")[0]
				yco = i.location_id.split(" ")[1]

			end
		
			if defined? oldxco != nil

				xdistance = xco - oldxco
				ydistance = yco - oldyco
				slope = xdistance/ydistance	

				y = 0
				while y < (ydistance).abs do
				

					xindex = (y*slope).round

					cost = Math.squrt(1 + slope*slope)

					avrgDistFromMiddle = ((yco + oldyco)/2 - 978).abs
					mercaterDistFactor = -0.0003*avrgDistFromMiddle*avrgDistFromMiddle + 0.0281*avrgDistFromMiddle + 1.1574
					cost = (cost*mercaterDistFactor*0.002)*(1/0.02)

					totalLegCost = totalLegCost + cost

				y +=1
				end	
			end

			totalCost = totalLegCost + totalCost

			oldxco = xco
			oldyco = yco

		end

		return [totalCost*0.00003316794574, totalCost]

	end
end
