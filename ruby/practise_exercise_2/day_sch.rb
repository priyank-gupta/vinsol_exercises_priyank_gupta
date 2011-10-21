## GENERAL COMMENTS - Good job in handling edge cases
## extract DateTime.strptime(start_t,"%H%M").to_time.utc in a seperate function - its being used repeatedly

require "date"

class BusinessCenterHours
	
	def initialize(start_t, end_t)
		@days_record = {"updated_days" => {}, "closed_days" => []}																								#hash to store days updates to new timings and closed days
		@start_t, @end_t = string_to_time(start_t), string_to_time(end_t)
	end
	
	def update(date, start_t, end_t)
		#### COMMENT - Should be date.is_a?(String)
		day,date = parse_date_time(date) if date.is_a?(String)		                                                # if input is in string format then parse it in date_time format
		@days_record["updated_days"][date] = [string_to_time(start_t), string_to_time(end_t)]		                  #storing in hash with date as key and start time/end time as values
	end
	
	
	
	def closed(*days)
		### COMMENT - Refactored Code
		days.each do |el|
			unless @days_record["closed_days"].include?(el)	                                                  			#if given closed is not in the list
				day,el = parse_date_time(el) if el.is_a?(String)                                                			#if the input is string then parse it in date_time format
				@days_record["closed_days"] << el																																			#storing closed days in array
			end
		end	
	end
	
	
	
	
	def calculate_deadline(meet_dur, date_time)
		meet_dur /= 36
		day, date, time = parse_date_time(date_time)			                                                        #parsing variable in date_time format
		start_t, end_t = check_updated(day, date)			                                                          	#checking if the date or day is updated to have new start time/end time
		start_t = time if (start_t.hour < time.hour && start_t.min < time.min)
		date_temp = date
		
		loop do
			if is_holiday?(date_temp)			                                                                          # checking if a particular day is holiday
				date_temp += 1	                                                                                  		# if yes then move on to next day
			else
			  #### preferred time lies within working hours of same day
				if (end_t.hour*100 + end_t.min) >= ((start_t.hour*100 + start_t.min) + meet_dur) && end_t > start_t		#checking if the end time of the day is greater than meeting duration and start time of day/start time of meeting
					meet_end_time = (start_t.hour*100 + start_t.min) + meet_dur		                                    	#calculating the meeting deadline time
					
					day = (find_day date_temp.wday).to_s.capitalize		                                                  #day of the meeting deadline
					date = date_temp.strftime("%b %d, %Y")		                                                          #date of meeting deadline
					meet_end_time = ("%04d" % meet_end_time).to_s
					time = DateTime.strptime(meet_end_time,"%H%M").strftime("%H:%M hours")		                          #parsing time in correct format
					return "#{day} #{date} #{time}"			                                                                      #final output
			  #### preferred start time lies after working day's end time
				elsif (end_t.hour - start_t.hour) < 0 && (end_t.min - start_t.min) < 0		                          	#if end time is less than start time of day/start time of meeting
					date_temp += 1		                                                                                  #move to next day
				
				#### preferred end time lies after working day's end time
				else
					a = end_t.hour - start_t.hour
					b = end_t.min - start_t.min
					######## COMMENT - meet_dur -= (a*100 + b).to_i
					meet_dur -= (a*100 + b)		                                                          #calculating the remaining time left for meeting
					date_temp += 1		                                                                                	#move to next day
				end
				start_t, end_t = check_updated(find_day(date_temp.wday), date_temp)		                              	#check if the next day has its start time/end time updated
			end
		end
	end	
	
	
	
	private
	
  def string_to_time(str_time)
    DateTime.strptime(str_time, "%H%M").to_time.utc
  end
    
	def check_updated(day, date)		                                                                          	#day and date associated to a particular date as argument
		start_t = @start_t
		end_t = @end_t
		##### COMMENT - Make the folowing condition a fuction like you did for is_holiday
		if is_updated?(day, date)
		  
		  ####### should be written as - !!@days_record["updated_days"][date] 
		  ####### Do youo need to use dup here????
		  
			start_t = @days_record["updated_days"][date] ? @days_record["updated_days"][date][0] : @days_record["updated_days"][day][0] 		#store value of start time and
			end_t = @days_record["updated_days"][date] ? @days_record["updated_days"][date][1] : @days_record["updated_days"][day][1]		#end time for updated day
		end				
		[start_t, end_t]
	end
	
	def is_updated?(day, date)
		@days_record["updated_days"][date] || @days_record["updated_days"][day]
	end
	
	
	def is_holiday?(date)			
		day = find_day(date.wday)	                                                                              	#finding the day associated to a day_num
		@days_record["closed_days"].include?(day) || @days_record["closed_days"].include?(date.to_date)
	end
	
	
	
	def parse_date_time(date_time)		                                                                        	#date_time in string format
		                                                                                                          #### COMMENT - Dont implement a feature in error handling
		date_time = date_time =~ /^([\w]{3} [\d]{2}, [\d]{4} [\d]{4})$/ ? DateTime.strptime(date_time, "%b %d, %Y %H%M") : DateTime.strptime(date_time, "%b %d, %Y")
		[find_day(date_time.wday), date_time.to_date, date_time.to_time.utc]
	end
	
	
	
	def find_day(day_num)
		case day_num
		when 1 then :mon
		when 2 then :tue
		when 3 then :wed
		when 4 then :thu
		when 5 then :fri
		when 6 then :sat
		else :sun
		end
	end
	
end

h = BusinessCenterHours.new("0900", "1500")
h.update("Jan 4, 2011", "0800","1300")
h.update(:sat,"1000","1700")
h.closed(:wed,:thu,"Dec 25, 2011")
deadline = h.calculate_deadline(7*60*60, "Dec 24, 2011 1845")
puts "Meeting Deadline is :: #{deadline}"

