class UrlsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    params[:short_url] = Url.create_short_url if url_params[:short_url].nil?
    @url = Url.new(url_params)
    @url.user_id = current_user.id
    if @url.save
      respond_to do |format|
        format.json {render json: '200'}
      end
    else
      respond_to do |format|
        format.json {render json: '500'}
      end
    end

  end

  def redirect
    @url = Url.find_by(short_url: params[:short_url])
    return render status: 404 if @url.nil?
    redirect_to @url.url
  end

  private

  def url_params
    params.permit(:url, :short_url)
  end


end
