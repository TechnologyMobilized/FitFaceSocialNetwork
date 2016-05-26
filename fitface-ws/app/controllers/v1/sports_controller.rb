module V1
  class SportsController < ActionController::Base

    def index
      user = User.authenticate_user(params[:token])
      if user[0] == true
        @user = user[1]
        
        sports = Sport.where("is_active = true")
        total_sports = sports.count

        sports = sports.order("created_at desc").limit(10).offset(params[:off_set])
        @sports = []

        sports.each do |sport|
          @sports.push({ id: sport.id, name: sport.name, is_sport: @user.sports.where("sport_id = ?", sport.id).present? ? 1 : 0 })
        end

        off_set = params[:off_set].to_i + 10

        @pagination = {
          sports: total_sports,
          off_set: off_set,
          load_more: total_sports > off_set ? 1 : 0,
          url: "/v1/sports?off_set=#{off_set}&token=#{params[:token]}"
        }

        render json: { sports: @sports, pagination: @pagination, status: 200 }, status: 200
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def create
      user = User.authenticate_user(params[:token])
      if user[0] == true
        @user = user[1]

        sport = @user.user_sports.create(sport_id: params[:sports][:id])

        if sport.save
          render json: { success: "Successfully added sport!", status: 200 }, status: 200
        else
          render json: { error: "Failed to add sport!", status: 301 }, status: 301
        end

      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def destroy
      user = User.authenticate_user(params[:token])
      if user[0] == true
        @user = user[1]

        sport = @user.user_sports.where("sport_id = ?", params[:id]).delete_all

        render json: { success: "Successfully deleted sport!", status: 200 }, status: 200
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

  end
end