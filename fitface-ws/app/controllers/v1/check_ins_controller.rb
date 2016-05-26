module V1
  class CheckInsController < ActionController::Base

    def index
      user = User.authenticate_user(params[:token])
      if user[0] == true
        user = user[1]
        check_ins = CheckIn.where("user_id IN (?)", user.partners.select("id")).order("check_ins.created_at")
        total_checkins = check_ins.count

        check_ins = check_ins.limit(10).offset(params[:off_set])
        @check_ins = []
        check_ins.each do |check_in|
          @user = { id: check_in.user.id, name: check_in.user.name, image: "" }
          @check_ins.push({ id: check_in.id, user: @user, place: check_in.gym.name, time: "12 minutes" })
        end

        off_set = params[:off_set].to_i + 10

        @pagination = {
          events: total_checkins,
          off_set: off_set,
          load_more: total_checkins > off_set ? 1 : 0,
          url: "/v1/check_ins?off_set=#{off_set}&token=#{params[:token]}"
        }

        render json: { check_ins: @check_ins, pagination: @pagination, status: 200 }, status: 200
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def create
      user = User.authenticate_user(params[:token])
      if user[0] == true
        user = user[1]
        @check_in = user.check_ins.create(gym_id: params[:check_in][:gym_id])
        
        if @check_in.save
          render json: { success: "Successfully checked in gym.", status: 200 }, status: 200
        else
          render json: { error: "Failed to check in gym.", status: 301 }, status: 301
        end
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end
  end
end