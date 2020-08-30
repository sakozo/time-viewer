class DiariesController < ApplicationController
  def create
    diary = Diary.new(diary_params)
    if diary.save
      redirect_to user_path(current_user.id)
    else
      
    end

  end

  def edit
    diary = Diary.find_by(record_date: record_date_param)

    if diary.update(diary_params)
      redirect_to user_path(current_user.id)
    else
      # TODO: 処理
    end
  end
end

private

def diary_params
  params.require(:diary).permit(:diary, :record_date).merge(user_id: current_user.id)
end

def record_date_param
  params.require(:diary).permit(:record_date)[:record_date]
end