
class Album

	def initialize
		@playlist = ['A','B','C','D','E','R','T']
	end
	
	def func
		print "Forward or previous (F/P) : "
		opt = gets.chomp.upcase
		case opt
		when 'F'
		p @playlist
			print "number of steps to forward : "
			num = gets.chomp.to_i
			temp = @playlist.shift(num)
			@playlist = @playlist.push(temp).flatten
		when 'P'
			p @playlist
			print "number of steps to backward : "
			num = gets.chomp.to_i
			temp = @playlist.pop(num)
			@playlist = @playlist.unshift(temp).flatten
		else
			"Wrong input"
		end
	end
end

a = Album.new
begin
	p a.func
	print "do you want to continue (y/Y): "
	choice = gets.chomp.upcase
end while (choice == 'Y')
