module CFscraper
	class Scraper
		
    	def initialize(url)
    		@dom = Scraper.html_loader(url)
    	end

		def self.html_loader(url)
	    	@dom = @html = nil
    		begin
	    		@html ||= open(URI.parse(url))
    			@dom ||= Nokogiri::HTML(@html)
    		rescue
	    		puts "Can not download html file"
    		end
    		@dom
    	end

    	def self.attributes
    		[]
    	end

		def to_hash
	    	self.class.attributes.reduce({}) { |hash, attr| hash[attr.to_sym] = self.send(attr.to_sym); hash }
	    end
	    
	end
end