module V1
  class AchievementsController < ActionController::Base

    def index
      user = User.authenticate_user(params[:token])
      if user[0] == true
        user = user[1]

        achievements = user.achievements
        total_achievements = achievements.count

        achievements = achievements.limit(10).offset(params[:off_set])
        @achievements = []

        achievements.each do |achievement|
          @achievements.push({ id: achievement.id, achieve: achievement.achieve, event: achievement.event })
        end

        off_set = params[:off_set].to_i + 10

        @pagination = {
          blocks: total_achievements,
          off_set: off_set,
          load_more: total_achievements > off_set ? 1 : 0,
          url: v1_achievements_path(token: params[:token], off_set: off_set)
        }

        render json: { achievements: @achievements, pagination: @pagination, status: 200 }, status: 200
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def create
      user = User.authenticate_user(params[:token])
      if user[0] == true
        user = user[1]
        
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def edit
      user = User.authenticate_user(params[:token])
      if user[0] == true
        user = user[1]

      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def update
      user = User.authenticate_user(params[:token])
      if user[0] == true
        user = user[1]

      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def destroy
      user = User.authenticate_user(params[:token])
      if user[0] == true
        user = user[1]

      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end
  end
end