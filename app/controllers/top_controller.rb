class TopController < ApplicationController
  def index
    @work = Work.today_work
  end
end
