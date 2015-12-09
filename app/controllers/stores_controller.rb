class StoresController < ApplicationController
  def show
    @store = find_store
  end

  private

  def find_store
    Store.find_by(slug: params[:slug])
  end
end
