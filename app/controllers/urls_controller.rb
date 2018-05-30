class UrlsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    unless Url.valid_url?(url_params[:url])
      return respond_to do |format|
        format.json {render json: {message: 'Url is invalid'}, status: 500}
      end
    end
    params[:short_url] = Url.create_short_url if url_params[:short_url].blank?
    @url = Url.new(url_params)
    @url.user_id = current_user.id
    begin @url.save!
      respond_to do |format|
        format.json {render json: {message: @url.short_url}, status: 200}
      end
    rescue => e
      if e.class == ActiveRecord::RecordNotUnique
        message = 'Short url in not unique'
      else
        message = 'Server Error'
      end
      respond_to do |format|
        format.json {render json: {message: message}, status: 500}
      end
    end
  end

  def redirect
    @url = Url.find_by(short_url: params[:short_url])
    return render status: 404 if @url.nil?
    @url.increment!(:count)
    redirect_to @url.url
  end

  private

  def url_params
    params.permit(:url, :short_url)
  end


end
