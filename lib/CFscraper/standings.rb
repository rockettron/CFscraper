require_relative "helper"

module CFscraper
    class Participant < CFscraper::Scraper

        def initialize(dom, params = {})
            @dom = dom
            @attributes = %w{
                place
                participant
            }
            if params[:gym]
                @attributes << "task_count"
                @attributes << "penalty"
            else 
                @attributes << "score"
            end
        end

        def place
            @place ||= @dom.at_css("td").text.to_i
        end

        def participant
            @participant ||= @dom.css(".contestant-cell").text.strip
        end

        def task_count
            @task_count ||= @dom.css("td")[2].text.strip.to_i
        end

        def penalty
            @penalty ||= @dom.css("td")[3].text.strip.to_i
        end

        def score
            @score ||= task_count
        end

    end

	class StandingsContest < CFscraper::Scraper
        def initialize(*attr)
            super(*attr)
            @attributes = %w{
                people
            }
        end

        def people(params = {})
            @people ||= node_dom.map { |dom_person| Participant.new(dom_person, params).to_hash }
        end

        private

        def node_dom
            @dom.css(".standings tr[participantid]")
        end

    end

    class StandingsGym < StandingsContest
        def people
            super(gym: true)
        end
    end
end
    	