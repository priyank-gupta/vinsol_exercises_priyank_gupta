
class Object
	
	def attempt(*args, &block)
		meth = args[0]
		if meth
			args.shift
			methods.include?(meth) ? send(meth, *args, &block) : nil
		else
			block.call
		end
	end
	
end

class Article
	def author(name)
		"a" + name
	end
	
	def self.book_name(book)
		"b"+book
	end
end

article = Article.new
p Article.attempt(:book_name, "killer")
p article.attempt(:author, "priyank")
p "abc".attempt(:reverse)
p [1,2,3].attempt(:collect) {|val| val*2}

article.attempt {	p "this is a block" }
a = nil
p a.attempt (:reverse)
a.attempt {p "I am nill"}
