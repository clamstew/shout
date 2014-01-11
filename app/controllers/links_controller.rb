class LinksController < ApplicationController
  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      # Assign a short word to this link
      word = UrlWord.where(:link_id => nil).random(1).first
      # TODO: Check if word is nil (only happens when all words are in use)
      word.link = @link
      word.expire_date = DateTime.now + params[:expire_date].to_i.minutes
      word.save!

      render 'create'
    else
      render 'new'
    end
  end

  def show
    word = UrlWord.find_by(:word => params[:path])
    puts "Finding #{params[:path]} -> #{word.inspect}"

    if word.nil? || word.link_id.nil? || word.expired?
      # Free word if needed
      word.update(:link_id => nil) if word.expired?
      raise ActionController::RoutingError.new('Not Found')
    else
      redirect_to word.link.url
    end
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
