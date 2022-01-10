# frozen_string_literal: true

class UrlsController < ApplicationController
  def index
    # I know, it's awful, and in production env we need some pagination
    # or similar. But this is a test project, so.. :)
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)

    if @url.save
      redirect_to @url
    else
      render 'new'
    end
  end

  def forward(url)
    url.visited += 1
    url.save
    redirect_to url.original_url
  end

  def show
    @url = Url.find_by id: params[:id]
  end

  def retrieve
    if @url = Url.find_by(short_url: params[:unknown])
      forward(@url)
    else
      redirect_to root_path
    end
  end

  private

  def url_params
    params.require(:url).permit(:original_url, :custom_url)
  end
end
