class ResultTimesController < ApplicationController
  def create
    error_flg = false # エラーフラグ ループで保存する中で1つでもエラーがあると trueになる

    # 96ブロック分のループを回す 1週ごとに1レコード保存
    block_params.each do |block|

      # own_timeが未入力のブロックの場合はnextで次のループに入る
      if block[1] == ""
        next
      end

      # blockとown_timeのデータをマージ
      data = result_time_params.merge(block: block[0]).merge(own_time_id: block[1])
      result_time = ResultTime.new(data)
      unless result_time.save
        error_flg = true # saveに失敗した場合はflgを更新する
      end
    end

    if error_flg
      # TODO:処理
    else
      redirect_to user_path(current_user.id)
    end

  end

  private

  # record_dateを取得
  def result_time_params
    params.require(:result_time).permit(:record_date).merge(user_id: current_user.id)
  end
  
  # 96ブロックのidと入力されたown_time_idを取得
  def block_params
    params.require(:block)[0]
  end
end
