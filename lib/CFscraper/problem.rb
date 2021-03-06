require_relative "helper"

module CFscraper
	class Problem < CFscraper::Scraper
        def initialize(*attr)
            super(*attr)
    	    @attributes = %w{
        	   title
               time_limit   
               memory_limit
               input_file
               output_file
               statement
               input_specification
               output_specification
               note
            }    	
        end

    	def title
    		@title ||= node_dom.at_css(".header .title").text
    	end

    	def time_limit
    		@time_limit ||= node_dom.at_css(".header .time-limit").children.last.text	
    	end

    	def memory_limit
    		@memory_limit ||= node_dom.at_css(".header .memory-limit").children.last.text
    	end

    	def input_file
    		@input_file ||= node_dom.at_css(".header .input-file").children.last.text
    	end

    	def output_file
    		@output_file ||= node_dom.at_css(".header .output-file").children.last.text
    	end

    	def statement
    		@statement ||= node_dom.css("div p").map(&:to_html).join
    	end

    	def input_specification
    		@input_specification ||= node_dom.css(".input-specification p").map(&:to_html).join
    	end

    	def output_specification
    		@output_specification ||= node_dom.css(".output-specification p").map(&:to_html).join
    	end

    	def note 
    		@note ||= node_dom.css(".note p").map(&:to_html).join
    	end

    	private 

    	def node_dom
    		@dom.at_css(".problem-statement")
    	end

    end
end