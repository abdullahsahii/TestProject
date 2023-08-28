class SearchesController < ApplicationController

  def new
    @search = Search.new()
  end

  def create
    @search = Search.new(search_params)
    if @search.save
      z
    else
      render :new
    end

  end

  def search_params
    params.require(:search).permit()
  end
end
