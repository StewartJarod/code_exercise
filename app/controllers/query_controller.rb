class QueryController < ApplicationController

  def index
    order = Sorter.sanatize_order(params[:sort])
    render json: Sorter.sort(Files.all, order)
  end
end
