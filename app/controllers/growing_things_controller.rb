class GrowingThingsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @growing_thing = GrowingThing.new
    @growing_thing.user_id = current_user.id
  end

  def create
    @growing_thing = GrowingThing.new(growing_thing_params)

    if @growing_thing.save
        redirect_to users_profile_path(current_user), alert: "Changes saved"
    else
      render :new
    end
  end

  def edit
    @growing_thing = GrowingThing.find(params[:id])

    if @growing_thing.user_id != current_user.id
      redirect_to users_profile_path(current_user), alert: "That growing thing doesn't belong to you"
    end
  end

  def update
    @growing_thing = GrowingThing.find(params[:id])
    if @growing_thing.update(growing_thing_params)
      redirect_to users_profile_path(current_user), alert: "Update Successful"
    else
      render :edit
    end
  end

  def destroy
      @growing_thing = GrowingThing.find(params[:id])

      if @growing_thing.destroy
        flash.notice="#{@growing_thing.name} was deleted"
        redirect_to users_profile_path(current_user)
      else
        render :edit
      end
  end


  private

  def growing_thing_params
    params.require(:growing_thing).permit(:name, :user_id)
  end


end
