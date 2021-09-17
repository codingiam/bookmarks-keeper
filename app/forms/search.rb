# frozen_string_literal: true

class Search < ActiveModel::Form # :nodoc:
  attribute :q, :string

  validates_presence_of :q
end
