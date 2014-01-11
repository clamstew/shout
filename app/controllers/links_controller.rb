class LinksController < ApplicationController
  def new
    @link = Link.new
  end

  def create
    create_params = link_params
    if create_params[:expire_date]
      create_params[:expire_date] = DateTime.now + create_params[:expire_date].to_i.minutes
    end

    @link = Link.new(create_params)

    if @link.save
      # Assign a short word to this link
      word = UrlWord.where(:link_id => nil).random(1).first
      # TODO: Check if word is nil (only happens when all words are in use)
      word.link = @link
      word.save!

      render 'create'
    else
      render 'new'
    end
  end

  def show
  end

  private

  def link_params
    params.require(:link).permit(:url, :expire_date)
  end
end
