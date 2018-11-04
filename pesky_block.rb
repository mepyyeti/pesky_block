#!/usr/bin/env ruby
#pesky_block.rb

class DoSomething
	attr_reader :choice
	
	def choice=(choice)
		print 'enter red or blue'
		if choice ==''
			raise 'choice can\'t be blank'
		end
		@choice = choice
	end

	def initialize(choice)
		self.choice = choice
	end
	
	def some_block(choice, &theblock)
		puts 'no block given' unless block_given?
		puts "block follows:"
		if choice == 'blue' || choice == 'b'
			theblock.call(self.choice)
		elsif choice == 'red' || choice == 'r'
			theblock.call(self.choice)
		else
			print "good bye"
		end
	end
end

print 'pick red or blue: '
entry = gets.chomp.to_s

X = DoSomething.new(entry)
X.choice
X.some_block(entry) { |e| print "selected #{e}."}