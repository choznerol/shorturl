class MappingsController < ApplicationController
  before_action :set_mapping, only: [:show]

  # GET /mappings
  def index
    @mappings = Mapping.all
  end

  # GET /mappings/1
  def show; end

  # GET /mappings/new
  def new
    @mapping = Mapping.new
  end

  # POST /mappings
  def create
    @mapping = Mapping.new(mapping_params)

    if @mapping.save
      redirect_to @mapping, notice: 'Mapping was successfully created.'
    else
      render :new
    end
  end

  private

  def set_mapping
    @mapping = Mapping.find(params[:id])
  end

  def mapping_params
    params.require(:mapping).permit(:target_url)
  end
end
