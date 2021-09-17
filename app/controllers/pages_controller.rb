# frozen_string_literal: true

class PagesController < ApplicationController # :nodoc:
  include HighVoltage::StaticPage

  def home
    locals search: Search.new(q: "")
  end
end
