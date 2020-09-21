class RelationshipsController < ApplicationController
  before_action :set_user, except: :update

  def create
    following = current_user.follow(@user)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
      redirect_to settings_path
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to settings_path
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to settings_path
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to settings_path
    end
  end

  def update
    record = Relationship.find_by(user_id: params[:user_id], follow_id: params[:id])
    if record.update(status: 1)
      redirect_to settings_path
    else
      # TODO: 処理
    end
  end

  private

  def set_user
    @user = User.find(params[:follow_id])
  end
end
