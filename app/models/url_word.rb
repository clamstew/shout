class UrlWord < ActiveRecord::Base
  belongs_to :link
  validates :word, :uniqueness => true, :presence => true

  def expired?
    self.expire_date < DateTime.now
  end
end
