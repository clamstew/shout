class Link < ActiveRecord::Base
  validates :url, :url => true
  validates :expire_date, :presence => true
  has_one :url_word
end
