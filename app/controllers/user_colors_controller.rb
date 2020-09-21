class UserColorsController < ApplicationController
  def create
    user_color = UserColor.new
    user_color.user_id = current_user.id
    user_color.colors = user_color_params

    if user_color.save
      flash[:success] = '表示色の設定を行いました'
      redirect_to user_path(current_user.id)
    else
      # TODO: 処理
    end
  end

  def update
    user_color = UserColor.find_by(user_id: current_user.id)

    if user_color.update(colors: user_color_params)
      flash[:success] = '表示色の設定を行いました'
      redirect_to user_path(current_user.id)
    else
      # TODO: 処理
    end
  end

  private

  def user_color_params
    input_params = params.require(:user_color).permit(:color1, :color2, :color3, :color4)
    input_params[:color1] + ':' + input_params[:color2] + ':' + input_params[:color3] + ':' + input_params[:color4]
  end
end
