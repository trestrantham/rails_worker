class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.create(activity_params)

    if @activity.valid?
      TripleNumber.perform_async(params[:value])
      redirect_to(activities_path)
    else
      render action: "new"
    end
  end

  protected

  def activity_params
    params.require(:activity).permit(:desc, :value)
  end
end
