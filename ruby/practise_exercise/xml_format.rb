
class XML_Format
	
	require 'rubygems'
	require 'nokogiri'
	
	$arr = []
	
	def initialize f
	
		file = File.open(f)
		xml_doc = Nokogiri::XML(file)
		file.close
		root_child = xml_doc.root().children
		iterate root_child
		output $arr
		
	end
	
	private
	
	def iterate root_child_itr
	
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
	
	def scan root_child_scan

		for i in 0...root_child_scan.length do
	
			if root_child_scan[i].text =~ /\w\s*\n/
				iterate root_child_scan[i].children
			end
	
		end			
	end
	
	def output arr_out
	
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
file = gets.chomp
XML_Format.new(file)

