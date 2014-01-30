class Link < ActiveRecord::Base
  validates :url, :url => true
  has_many :url_words
end
