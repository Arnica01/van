class MainController < ApplicationController



  def index
    @schedules = Schedule.all
  end


  def search

    schedule = params[:destination]
    if params[:destination]
      @schedule = Schedule.where('lower(title) LIKE ?', "%#{params[:destination].downcase}%")
                      .or(Schedule.where('lower(author) LIKE ?', "%#{params[:destination].downcase}%"))
    else
      @schedule = Schedule.all
    end

    @schedulelist = Schedule.select(:title).distinct
    @schedule = Schedule.new
    render 'schedules/index'

  end

  def self.search(destination)
    if destination
      where('name LIKE ?', "%#destination%")
    else
      all
    end
  end

end
