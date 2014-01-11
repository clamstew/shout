class UrlWord < ActiveRecord::Base
  belongs_to :link
  validates :word, :uniqueness => true
end
