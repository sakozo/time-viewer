class UsersController < ApplicationController
  def index
    
  end

  def show
    @user = User.find(params[:id])
    @own_time = OwnTime.new
    @result_time = ResultTime.new
    @project = Project.new

    # own_timeの選択肢を設定
    @all_select_time = OwnTime.all
    @select_time1 = OwnTime.where(time_type: 1)
    @select_time2 = OwnTime.where(time_type: 2)
    @select_time3 = OwnTime.where(time_type: 3)
    @select_time4 = OwnTime.where(time_type: 4)

    # own_timeの数をJSに渡してカウント用配列を作る
    # own_time_idは1インデックス、配列は0インデックスのため1インデックスに合わせるため+1している
    gon.own_time_count = @all_select_time.size + 1

    # own_timeの名前リストをgonでJSに渡す
    # 1インデックスに合わせているためown_time_name_listの最初の要素は空文字にしている
    own_time_name_list = [""]
    @all_select_time.each do | own_time |
      own_time_name_list << own_time.name
    end
    gon.own_time_list = own_time_name_list

    # プロジェクトの残り日付 
    #@projects = Project.where(user_id: current_user.id)

    # TODO:天気自動記録機能の実装
    #環境変数をJSに渡す
    #gon.wheather_api_key = ENV['OPEN_WEATHER_API_KEY']

    # 日付とown_timeのセット
    params_date = params[:format]
    if params_date == nil
      @date = Date.today
    else
      @date = params_date
    end

  end

  def update
    user = User.find(current_user.id)
    if user.update(user_params)
      redirect_to user_path
    else
      render new_user_path
    end
  end

  def date
    # 表示する日付をparamsから取得する
    show_date = params[:format]

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :icon)
  end

end
