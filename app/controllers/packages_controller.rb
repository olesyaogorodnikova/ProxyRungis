class PackagesController < ApplicationController

  def index
  end

  def show
    @package = Package.find(params[:id])
  end
end
