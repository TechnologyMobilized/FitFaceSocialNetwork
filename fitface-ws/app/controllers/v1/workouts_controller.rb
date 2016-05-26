module V1
  class WorkoutsController < ActionController::Base

    def index
      user = User.authenticate_user(params[:token])
      if user[0] == true
        @user = user[1]

        workouts = Workout.where("is_active = true")
        total_workouts = workouts.count

        @workouts = []
        workouts = workouts.order("name").limit(10).offset(params[:off_set])

        workouts.each do |workout|
          @workouts.push({ id: workout.id, name: workout.name, is_workout: @user.workouts.where("workouts.id = ?", workout.id).present? ? 1 : 0 })
        end

        off_set = params[:off_set].to_i + 10

        @pagination = {
          workouts: total_workouts,
          off_set: off_set,
          load_more: total_workouts > off_set ? 1 : 0,
          url: "/v1/workouts?off_set=#{off_set}&token=#{params[:token]}"
        }

        render json: { workouts: @workouts, pagination: @pagination, status: 200 }, status: 200
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def create
      user = User.authenticate_user(params[:token])
      if user[0] == true
        @user = user[1]

        workout = @user.user_workouts.create(workout_id: params[:workouts][:id])

        if workout.save
          render json: { success: "Successfully added workout!", status: 200 }, status: 200
        else
          render json: { error: "Failed to add workout!", status: 301 }, status: 301
        end

      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def destroy
      user = User.authenticate_user(params[:token])
      if user[0] == true
        @user = user[1]

        workout = @user.user_workouts.where("workout_id = ?", params[:id]).delete_all

        render json: { success: "Successfully deleted workout!", status: 200 }, status: 200
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

  end
end