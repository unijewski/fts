class Article < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  def self.title_matches(args)
    tire.search do
      query do
        boolean do
          must {string "title:#{args}"}
          must {string "created_at:[2014-01-01 TO 2014-10-10]"}
        end
      end
      highlight :title
    end
  end

end
