class Link < ActiveRecord::Base
  validates :url, :url => true
  has_one :url_word
end
