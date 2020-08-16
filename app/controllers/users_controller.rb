class UsersController < ApplicationController
  def index
    
  end

  def show
    @user = User.find(params[:id])
    @own_time = OwnTime.new
    @result_time = ResultTime.new

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
    # params[:format]で日付が渡ってきている場合はその日付を表示
    params_date = params[:format]
    if params_date == nil
      @date = Date.today
    else
      @date = params_date
    end

    # DBに登録済みのResultTimeを取得する
    # ハッシュに詰める hashなので重複は上書きされて最新の値がセットされるはず
    result_times = ResultTime.where( user_id: current_user.id ).where( record_date: @date )
    @result_times_hash = Hash.new { "" } #存在しないキーを指定した場合にから文字を返すように宣言
    result_times_type_hash = {} # JSに渡す用のblock_idとtype_idのハッシュ

    # テキストボックスにセットする用の@result_times_hash、ブロックに色をつける用のresult_times_type_hash
    result_times.each do |result_time|
      @result_times_hash.store(result_time.block, result_time.own_time_id)
      result_times_type_hash.store(result_time.block, result_time.own_time.time_type)
    end

    #hashの形でJSに渡す
    gon.result_times_type = result_times_type_hash

    gon.user_id = current_user.id

    # colorここから
    if UserColor.find_by(user_id: current_user.id).present?
      # 色が登録済みの場合
      @user_color = UserColor.find_by(user_id: current_user.id)
      colors = @user_color.colors.split(':')
      @initial_value1 = colors[0]
      @initial_value2 = colors[1]
      @initial_value3 = colors[2]
      @initial_value4 = colors[3]
    else
      # 未登録の場合はデフォルト初期値をViewに渡す
      @user_color = UserColor.new
      @initial_value1 = "#ff0000"
      @initial_value2 = "#0000ff"
      @initial_value3 = "#00ff00"
      @initial_value4 = "#ffff00"
    end

    # 睡眠時間のグレーを先頭に追加してgonでJSに渡す
    gon.user_color_array = colors.unshift("grey")
    # colorここまで
  end

  def update
    user = User.find(current_user.id)
    if user.update(user_params)
      redirect_to user_path
    else
      render new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :icon)
  end

end
