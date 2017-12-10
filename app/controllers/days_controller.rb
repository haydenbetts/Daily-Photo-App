class DaysController < ApplicationController
## TODO figure out how to make this controller look better, what
## actually has to be here...
  def show
    if params[:growing_thing_id]
      @growing_thing = GrowingThing.find_by(id: params[:growing_thing_id])
      if @growing_thing.nil?
        # TODO alert not displaying
        redirect_to users_profile_path(current_user), alert: "GrowingThing not found"
      elsif @growing_thing.days.find_by(id: params[:id]).nil?
        # TODO alert not displaying
        redirect_to users_profile_path(current_user), alert: "Day not found"
      else
        @day = @growing_thing.days.find_by(id: params[:id])
      end
    else
      @day = Day.find(params[:id])
    end
  end

def edit
  if params[:growing_thing_id]
    @growing_thing = GrowingThing.find_by(id: params[:growing_thing_id])
    if @growing_thing.nil?
      # TODO alert not displaying
      redirect_to users_profile_path(current_user), alert: "GrowingThing not found"
    elsif @growing_thing.days.find_by(id: params[:id]).nil?
      # TODO alert not displaying
      redirect_to users_profile_path(current_user), alert: "Day not found"
    else
      @day = @growing_thing.days.find_by(id: params[:id])
    end
  else
    @day = Day.find(params[:id])
  end
end

def new
  if params[:growing_thing_id]
    @growing_thing = GrowingThing.find_by(id: params[:growing_thing_id])
    if @growing_thing.nil?
      # TODO alert not displaying
      redirect_to users_profile_path(current_user), alert: "GrowingThing not found"
    else
      # TODO we need to pass in the
      @day = Day.new(post_date: params[:post_date])
    end
  else
    @day = Day.find(params[:id])
  end
end

def create
  @day = Day.new(day_params)

  if @day.save
    if params[:day][:image].blank?
      redirect_to growing_thing_day_path(@day.growing_thing, @day), alert: "Changes saved"
    else
      render :action => "crop"
    end
  else
    render :new
  end
end

def update
  @day = Day.find(params[:id])

  if @day.update(day_params)
    if params[:day][:image].blank?
      redirect_to growing_thing_day_path(@day.growing_thing, @day), alert: "Changes saved"
    else
      render :action => "crop"
    end
  else
    render :edit
  end

end

private

def day_params
  params.require(:day).permit(:note, :post_date, :growing_thing_name, :growing_thing_id,
  :image, :crop_x, :crop_y, :crop_h, :crop_w)
end

end
