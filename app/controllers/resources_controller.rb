class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def index
    locals resources: Resource.all
  end

  def show
    locals resource: @resource
  end

  def new
    locals resource: Resource.new
  end

  def edit
    locals resource: @resource
  end

  def create
    @resource = Resource.new(resource_params)

    respond_to do |format|
      if @resource.save
        format.html do
          redirect_to @resource, notice: "Resource was successfully created."
        end
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @resource.update(resource_params)
        format.html do
          redirect_to @resource, notice: "Resource was successfully updated."
        end
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @resource.destroy
    respond_to do |format|
      format.html do
        redirect_to resources_url,
          notice: "Resource was successfully destroyed."
      end
    end
  end

  private

  def set_resource
    @resource = Resource.find(params[:id])
  end

  def resource_params
    params.require(:resource).permit(:url, :state)
  end
end
