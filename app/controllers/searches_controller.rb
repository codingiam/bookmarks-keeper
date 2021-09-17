# frozen_string_literal: true

class SearchesController < ApplicationController # :nodoc:
  def show
    search = Search.new(search_params)

    search.valid?

    locals search: search
  end

  private

  def search_params
    params.permit(:q)
  end
end
