class Article < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  def self.title_matches(args)
    tire.search do
        query {string "title:#{args}"}
    end
  end
  
end
