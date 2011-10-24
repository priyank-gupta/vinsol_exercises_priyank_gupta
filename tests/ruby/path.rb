
require "date"

class Flights
	
	def initialize
		@combinations = {}						#hash to store the combinations of flights
	end
	
	#storing flights combinations in hash
	def flights_combinations
		puts "How many combinations you want to enter"
		num = gets.chomp.to_i
		puts "Path, start time, arrival time, fare (Ex: A-B, 0925, 1245, 100)"
		for i in 0...num do
			print "Flight #{i+1} : "
			path = gets.chomp
			arr = path.split(/\s*,\s*/)
			for j in 1...arr.length do
				@combinations[arr[0].upcase.split(/\s*-\s*/)] = [] if @combinations[arr[0].upcase.split(/\s*-\s*/)] == nil
				if ( j == 1 || j == 2 )
					@combinations[arr[0].upcase.split(/\s*-\s*/)] << str_to_time(arr[j])
				else
					@combinations[arr[0].upcase.split(/\s*-\s*/)] << arr[j].to_i
				end
			end
		end
	end
	
	#finding shortest path in terms of shortest time or cheapest fare
	def shortest_flight
		
		print "Enter the two points (Ex: A-B) : "
		initial_node, final_node = gets.chomp.upcase.split(/\s*-\s*/)
		unvisited_nodes = []
		node_set_price = {initial_node => [0,initial_node]}
		node_set_time = {initial_node => [0,initial_node,str_to_time("0000")]}
		
		@combinations.each do |key, value|
			for i in 0...2 do
				unvisited_nodes << key[i] if !unvisited_nodes.include?(key[i])
			end
		end
		
		cheapest_price, path = find_least_price(node_set_price, unvisited_nodes.dup, final_node)				#for cheapest fare
		puts "\nCheapest price from #{initial_node} to #{final_node} is #{cheapest_price} and path is #{path}"
		
		earliest_time, path = find_earliest_time(node_set_time, unvisited_nodes.dup, final_node)		#for earliest time
		earliest_time /= 60
		hours = earliest_time.to_i / 60
		mins = earliest_time.to_i % 60
		puts "Earliest time is #{hours} hours and #{mins} mins, path is #{path}"
	end

	private
	
	def str_to_time(str)
		DateTime.strptime(str,"%H%M").to_time.utc				#parsing string into time format
	end
	
	def find_earliest_time(node_set, unvisited_nodes, final_node)
		
		time_zero = str_to_time("0000")
		
		while unvisited_nodes.length > 1			#loop till only final node is left 
			node_set_temp = node_set.dup
			node_set_temp.each do |node_key, node_val|			#iteration over node set
				current_node = node_key
				@combinations.each do |key, val|							#iteration to find the path from current node
					if key[0] == current_node
						if current_node != final_node
							if node_set[current_node][2] > val[1]
								temp = node_set[current_node][0] + (val[1] - val[0]) + 24*60*60 - (node_set[current_node][0] - (val[1] - time_zero))
							else
								temp = node_set[current_node][0] + (val[1] - val[0])
							end
							path_temp =	node_set[current_node][1] + key[1]
							if node_set[key[1]] == nil
								node_set[key[1]] = [temp, path_temp, val[1]]
							elsif node_set[key[1]][0] > temp
								node_set[key[1]] = [temp, path_temp] 
							end
						end
					end
				end
				unvisited_nodes.delete(current_node)						#delete visited nodes
			end
		end
		node_set[final_node]
	end
	
	def find_least_price(node_set, unvisited_nodes, final_node)
		
		while unvisited_nodes.length > 1						#loop till only final node is left 
			node_set_temp = node_set.dup
			node_set_temp.each do |node_key, node_val|				#iteration over node set
				current_node = node_key
				@combinations.each do |key, val|					#iteration to find the path from current node
					if key[0] == current_node
						if current_node != final_node
							temp = node_set[current_node][0] + val[2]
							path_temp =	node_set[current_node][1] + key[1]
							if node_set[key[1]] == nil
								node_set[key[1]] = [temp, path_temp]
							elsif node_set[key[1]][0] > temp
								node_set[key[1]] = [temp, path_temp] 
							end
						end
					end
				end
				unvisited_nodes.delete(current_node)					#delete visited nodes
			end
		end
		node_set[final_node]
	end
	
end

f = Flights.new
f.flights_combinations
f.shortest_flight
