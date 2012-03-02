require_relative 'application_controller'

class GuitarsController < ApplicationController
  def create
    guitar = Guitar.new(params[:guitar])
    guitar.store
    respond_with guitar
  end

  def show
    respond_with Guitar.find(params[:id])
  end

  def index
    respond_with Guitar.all
  end

  def edit
    respond_with Guitar.find(params[:id])
  end

  def update
    guitar = Guitar.find(params[:id])
    guitar.update(params[:guitar])
    respond_with guitar
  end

end