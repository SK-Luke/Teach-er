class PagesController < ApplicationController
  def home
  end

  def calendar
    # This section is for the calendar view
    start_date = params.fetch(:start_date, Date.today).to_date
    @availability_slot = Availability.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)

    # This section is for adding a new availability
    @new_availability = Availability.new

    # This section is for adding a new schedule
    @schedule = Schedule.new
  end
end
