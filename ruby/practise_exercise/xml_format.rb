##### 1. Move require statements to the top
##### 2. Check if the filename is valid and it exists
##### 3. Use Nokogiri to create nodes, the result should be valid xml. 
##### 4. Can you also put the output to another file instead of displaying the xml formatting on the console?

require 'rubygems'
require 'nokogiri'

class XML_Format
	
	##### Dont use global variable that are accessible outside the class here. You can use class variables
	
	def initialize file
		
		@@arr = []
		xml_doc = Nokogiri::XML(file)
		file.close
		root_child = xml_doc.root().children
		iterate root_child
		output @@arr
	end
	
	private				#methods are private after this
	
	## I like the fact that you've commented your code.
	## But most importantly, you should comment the logic part
	## Example - you've written 'root_child_itr.children.children[0]' explain what this is doing
	
	def iterate root_child_itr			#to iterate over the nodes		
	  
	  ## Collect root_child_itr.children in a variable since it being used twice
	  ## Can you try using some other conditional construct other than loop and break?
		while true
			temp = root_child_itr.children
			if temp.children[0] == nil			#checking if the node is innermost as innermost node will not be having any childnode
				@@arr.push temp
        break
			else
				scan root_child_itr		# iterate over the childnodes if it is not the parent of the innermost node
        break
			end		
		end
	end
	
	
	def scan root_child_scan			# to iterate over the childnodes
		for i in 0...root_child_scan.length do
			if root_child_scan[i].text =~ /\w\s*\n/		#ignoring newlines as they are also the child of node
				iterate root_child_scan[i].children
			end
		end			
	end
	
	
	def output arr_out			#to print the formated file
		
		out_doc = File.new("output.xml", "w")
		doc = Nokogiri::XML::DocumentFragment.parse(out_doc)
		people = Nokogiri::XML::Node.new "people", doc
		
		for i in 0...arr_out.length do
			
			person = Nokogiri::XML::Node.new "person", doc
			people.add_child(person)
			name = Nokogiri::XML::Node.new "name", doc
			person.add_child(name)
			first = Nokogiri::XML::Node.new "first", doc
			last = Nokogiri::XML::Node.new "last", doc
			address = Nokogiri::XML::Node.new "address", doc
			
			for j in 0...arr_out[i].length do
				
				if (arr_out[i][j] && j == 0)
					first.content = arr_out[i][j]
					name.add_child (first)
				elsif (arr_out[i][j] && j == 1)
					last.content = arr_out[i][j]
					first.add_next_sibling(last)
				elsif (arr_out[i][j] && j == 2)
					address.content = arr_out[i][j]
					last.add_next_sibling(address)
				end				
				
			end
		end
		
		out_doc.puts "<?xml version='1.0'?>"
		out_doc.puts people
		puts "Check output.xml for output"
	end
	
end

begin			#exception block for checking the availability of file
	puts "\nenter the filename you want to format (test1.xml/test2.xml/test3.xml)"
	f = gets.chomp				#asking for input of a filename from user
	file = File.open(f)			#opening xml file and saving its content
rescue StandardError => e			#exception handler
	puts "File not found... Try Again"
	retry
end
	
XML_Format.new(file)			#instantiating the XML_Foramt class

