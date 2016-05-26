module V1
  class MotivatesController < ActionController::Base
    def create
      user = User.authenticate_user(params[:token])
      if user[0] == true
        user = user[1]

        motivate = user.motivates.create(params[:motivate])
        if motivate.save
          render json: { success: "Successfully upload media!", status: 200 }, status: 200
        else
          render json: { success: "Failed to upload media!", status: 201 }, status: 201
        end
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def index
      user = User.authenticate_user(params[:token])
      if user[0] == true
        user = user[1]
        motivates = user.motivates
        total_motivates = motivates.count

        motivates = motivates.order("created_at").limit(10).offset(params[:off_set])
        @motivates = []

        motivates.each do |motivate|
          @motivates.push({ id: motivate.id, url: motivate.url.present? ? motivate.url : "", is_video: motivate.is_video? ? 1 : 0 })
        end

        off_set = params[:off_set].to_i + 10

        @pagination = {
          motivates: total_motivates,
          off_set: off_set,
          load_more: total_motivates > off_set ? 1 : 0,
          url: v1_motivates_path(off_set: params[:off_set], token: params[:token])
        }

        render json: { motivates: @motivates, pagination: @pagination, status: 200 }, status: 200
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def destroy
      user = User.authenticate_user(params[:token])
      if user[0] == true

      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end
  end
end