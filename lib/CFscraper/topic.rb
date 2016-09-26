require_relative "helper"

module CFscraper
    class Topic < CFscraper::Scraper

    	def self.attributes
    		%w{
    			id
    			title
                author
                time_create
                content
    		}    	
    	end

        def initialize(node_dom)
            @node = node_dom
        end

    	def id
    		@node['topicid'].to_i
    	end

    	def title
    		@node.at_css('.title a').text.strip
    	end

        def author
            @node.at_css('.info a').text.strip
        end

        def time_create
            @node.at_css('.format-humantime')['title']
        end

        def content
            node = @node.at_css('.ttypography').text
        end
    	
    end

    class Content < CFscraper::Scraper

        def topics
            @dom.css('.topic').map { |topic| Topic.new(topic).to_hash }
        end

    end
end
#doc = CFscraper::Topic.new("http://codeforces.com/")