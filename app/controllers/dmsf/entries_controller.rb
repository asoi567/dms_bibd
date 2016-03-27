class Dmsf::EntriesController < ApplicationController
  def index
    @dmsf_entries = Dmsf::Entry.order(:date).includes(:document, :standard_operation)
  end
end
