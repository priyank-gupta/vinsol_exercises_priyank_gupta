##### 1. Move require statements to the top
##### 2. Check if the filename is valid and it exists
##### 3. Use Nokogiri to create nodes, the result should be valid xml. 
##### 4. Can you also put the output to another file instead of displaying the xml formatting on the console?


class XML_Format
	
	require 'rubygems'
	require 'nokogiri'
	
	##### Dont use global variable that are accessible outside the class here. You can use class variables
	$arr = []			#global variable for final array
	
	def initialize f
		file = File.open(f)			#opening xml file and saving its content
		xml_doc = Nokogiri::XML(file)
		file.close
		root_child = xml_doc.root().children
		iterate root_child
		output $arr
	end
	
	private				#methods are private after this
	
	## I like the fact that you've commented your code.
	## But most importantly, you should comment the logic part
	## Example - you've written 'root_child_itr.children.children[0]' explain what this is doing
	
	def iterate root_child_itr			#to iterate over the nodes		
	  
	  ## Collect root_child_itr.children in a variable since it being used twice
	  ## Can you try using some other conditional construct other than loop and break?
		loop do
			if root_child_itr.children.children[0] == nil
				$arr.push root_child_itr.children
        break
			else
				scan root_child_itr
        break
			end		
		end
	end
	
	
	def scan root_child_scan			# to iterate over the childnodes
		for i in 0...root_child_scan.length do
			if root_child_scan[i].text =~ /\w\s*\n/
				iterate root_child_scan[i].children
			end
		end			
	end
	
	
	def output arr_out			#to print the formated file
	
		puts "<?xml version='1.0'?>\n<people>\n"
		
		for i in 0...arr_out.length do
			puts "	<person>\n		<name>"
			puts "			<first>#{arr_out[i][0]}</first>"
			puts "			<last>#{arr_out[i][1]}</last>"
			puts "		</name>\n	</person>"
		end
		
		puts "</people>"
	end
	
end

puts "enter the filename you want to format (test1.xml/test2.xml/test3.xml)"
file = gets.chomp				#asking for input of a filename from user
XML_Format.new(file)			#instantiating the XML_Foramt class

