class StoresController < ApplicationController
  def index
    @stores = Store.all.active
  end

  def show
    @store = find_store
  end

  private

  def find_store
    Store.find_by(slug: params[:slug])
  end
end
