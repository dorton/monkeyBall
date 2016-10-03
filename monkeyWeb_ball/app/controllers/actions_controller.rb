class ActionsController < ApplicationController
  def new
    @action = Action.new
  end

  def create
    @action = Action.new action_params
      if @action.save
       redirect_to datas_url, notice: 'Yup, you done actioned'
      else
       render :new
      end
  end

  def edit
    @action = Action.find(action_params)
  end

  def update
    @action = Action.find(params[:id])
      if @action.update(action_params)
        redirect_to datas_url, notice: 'Action was successfully created.'
      else
        render :edit
      end
  end


  def destroy
    @action = Action.find(params[:id])
    @action.destroy
    redirect_to datas_url, notice: 'Action was successfully destroyed.'
  end

  private

   def action_params
     params.require(:action_model).permit(:name)
   end


end
