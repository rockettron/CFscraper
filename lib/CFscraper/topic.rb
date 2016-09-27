require_relative "helper"

module CFscraper
    class Topic < CFscraper::Scraper

        def initialize(url_or_dom)
            if url_or_dom.class.name == "String"
                super(url_or_dom)
                upd_topic
            else
                @dom = url_or_dom
            end
            @attributes = %w{
                id
                title
                author
                time_create
                content
            } 
        end

    	def id
    		@id ||= @dom['topicid'].to_i
    	end

    	def title
    		@title ||= @dom.at_css('.title a').text.strip
    	end

        def author
            @author ||= @dom.at_css('.info a').text.strip
        end

        def time_create
            @time_create ||= @dom.at_css('.format-humantime')['title']
        end

        def content
            @content ||= @dom.at_css('.ttypography').text
        end

        def upd_topic
            @dom = @dom.at_css(".topic")
        end
    	
    end

    class Content < CFscraper::Scraper

        def initialize(*attr)
            super(*attr)
            @attributes = %w{ topics }
        end

        def topics
            @topics ||= @dom.css('.topic').map { |topic| Topic.new(topic).to_hash }
        end

    end
end
#doc = CFscraper::Topic.new("http://codeforces.com/")