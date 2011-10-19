## GENERAL COMMENTS - Good job in handling edge cases

require "date"

class BusinessCenterHours
	
	def initialize (start_t, end_t)
		@days_record = {"updated_days" => {}, "closed_days" => []}		#hash to store days updates to new timings and closed days
		@start_t = start_t.to_i
		@end_t = end_t.to_i
	end
	
	def update (date, start_t, end_t)
	  #### COMMENT - Should be date.is_a?(String)
		if date.class == String				# if input is in string format then parse it in date_time format
			day,date = parse_date_time(date)
		end
		@days_record["updated_days"][date] = [start_t, end_t]		##storing in hash with date as key and start time/end time as values
	end
	
	def closed (*days)
	  
	  ### COMMENT - Refactored Code
	  days.each do |el|
	    unless @days_record["closed_days"].find{ |day| day == el }
		    day,el = parse_date_time(el) if el.is_a?(String)			#if the input is string then parse it in date_time format
			  @days_record["closed_days"] << el		#storing closed days in array				
		  end
	  end
	  
    # days.each do |el|
    #   count = 1     
    #   @days_record["closed_days"].each do |val|
    #     if val == el        #checking whether the given closed day is already in the list or not
    #       count = 0
    #       break
    #     end 
    #   end
    #   
    #   if count == 1       #if given closed is not in the list
    #     if el.class == String     #if the input is string then parse it in date_time format
    #       day,el = parse_date_time(el)
    #     end
    #     @days_record["closed_days"].push el   #storing closed days in array
    #   end
    # end 
	end
	
	def calculate_deadline (meet_dur, date_time)
		meet_dur = meet_dur / 36
		day, date, time = parse_date_time(date_time)			#parsing variable in date_time format
		start_t, end_t = check_updated(day, date)				#checking if the date or day is updated to have new start time/end time
		start_t = time if start_t < time
		date_temp = date.dup
		loop do
			if is_holiday(date_temp)			# checking if a particular day is holiday
				date_temp += 1			# if yes then move on to next day
			else
				if end_t >= (meet_dur + start_t) && end_t > start_t		#checking if the end time of the day is greater than meeting duration and start time of day/start time of meeting
					meet_end_time = start_t + meet_dur			#calculating the meeting deadline time
					day = find_day date_temp.wday
					day = day.to_s.capitalize				#day of the meeting deadline
					date = date_temp.strftime("%b %d, %Y")		#date of meeting deadline
					meet_end_time = meet_end_time.to_s
					meet_end_time = "0#{meet_end_time}" if meet_end_time.length == 3
					meet_end_time = "00#{meet_end_time}" if meet_end_time.length == 2	
					time = DateTime.strptime(meet_end_time,"%H%M").strftime("%H:%M hours")		#parsing time in correct format
					puts "Meeting Deadline is :: #{day} #{date} #{time}"			#final output
					break
				elsif (end_t-start_t) < 0			#if end time is less than start time of day/start time of meeting
					date_temp += 1		#move to next day
				else
					meet_dur -= (end_t - start_t)		#claculating the remaining time left for meeting
					date_temp += 1			#move to next day
				end
				start_t, end_t = check_updated(find_day(date_temp.wday), date_temp)			#check if the next day has its start time/end time updated
			end
		end
	end	
	
	private
	
	def check_updated(day, date)			#day and date associated to a particular date as argument
		start_t = @start_t
		end_t = @end_t
		@days_record["updated_days"].each do |key, val|		
			if key == day || key.to_s == date.to_s			#checking if the particular day has been updated or not
				start_t = val[0].to_i			#store value of start time and
				end_t = val[1].to_i				#end time for updated day
				break
			end				
		end
		return [start_t, end_t]
	end
	
	def is_holiday(date)			
		day_num = date.wday
		if day_num == 0				# if the day number is zero ie sunday then true its a holiday
			return true
		end
		day = find_day(day_num)		#finding the day associated to a day_num
		count = 1
		@days_record["closed_days"].each do |val|
			if day == val || date.to_s == val.to_s		# if the particular day is closed or not
				count = 0
				return true			# if yes true its a holiday
			end
		end
		if count == 1
			return false			#else false its not a holiday
		end
	end
	
	def parse_date_time (date_time)			#date_time in string format
	  
    #### COMMENT - Dont implement a feature in error handling
    begin         #exception begining block
			date_time = DateTime.strptime(date_time, "%b %d, %Y %H%M")		#if the date_time string has hours in it then this will execute else
    rescue
      date_time = DateTime.strptime(date_time, "%b %d, %Y")     #this will execute
    end
		
		day_num = date_time.wday
		day = find_day(day_num)			#finding the day associated to a day_num
		date = date_time.to_date
		time = date_time.strftime("%H%M").to_i			#finding the time in date_time format
		return [day, date, time]
	end
	
	def find_day (day_num)
		day = case day_num
		when 1
			:mon
		when 2
			:tue
		when 3
			:wed
		when 4
			:thu
		when 5
			:fri
		when 6
			:sat
		else
			:sun
		end
		return day
	end
	
end

h = BusinessCenterHours.new("0900", "1500")

h.update("Jan 4, 2011", "0800","1300")
h.update(:sat, "1000","1700")
h.closed(:wed,:thu,"Dec 25, 2011")
h.closed(:wed)
h.calculate_deadline(12*60*60, "Dec 24, 2011")

