class AdminController < ApplicationController
  before_filter :redirect_unless_admin

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @word = params[:word]

    @url_word = UrlWord.find_or_create_by(:word => @word)
    @word_free = @url_word.link_id.nil?

    if @word && @word_free && @link.save
      # Word is free to use!
      @url_word.link = @link
      @url_word.expire_date = DateTime.now + 10.years
      @url_word.save!

      @minute_count = 60 * 24 * 356 * 10
      render 'links/create'
    else
      # Word is taken. Inform
      render 'new'
    end
  end

  def destroy
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end

  def redirect_unless_admin
    raise ActionController::RoutingError.new('Not Found') unless session[:admin]
  end
end
