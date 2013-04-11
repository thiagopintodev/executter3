class SitesController < ApplicationController
  before_action :set_site
  before_action :authorize_site!

  # GET /:permalink
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find_it(params[:id])
      # case action_name
      # when *%w(index)
      #   @sites = Site.all
      # when *%w(new)
      #   @site = Site.new
      # when *%w(create)
      #   @site = Site.new(site_params)
      # when *%w(show edit update destroy)
      #   @site = Site.find_it(params[:id])
      # else
      #   raise "this filter should not be placed for '#{action_name}' action" 
      # end
    end

    def authorize_site!
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:owner_id, :permalink)
    end
end
