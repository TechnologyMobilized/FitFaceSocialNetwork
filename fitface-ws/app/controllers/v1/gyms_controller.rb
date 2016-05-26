module V1
  class GymsController < ActionController::Base

    def index
      user = User.authenticate_user(params[:token])
      if user[0] == true
        @user = user[1]

        gyms = Gym.where("is_active = true")
        total_gyms = gyms.count

        @gyms = []
        gyms = gyms.order("created_at desc").limit(10).offset(params[:off_set])

        gyms.each do |gym|
          @gyms.push({ id: gym.id, name: gym.name, address: gym.address, contact: gym.contact_number, is_gym: @user.gyms.where("gyms.id = ?", gym.id).present? ? 1 : 0  })
        end

        off_set = params[:off_set].to_i + 10

        @pagination = {
          gyms: total_gyms,
          off_set: off_set,
          load_more: total_gyms > off_set ? 1 : 0,
          url: "/v1/gyms?off_set=#{off_set}&token=#{params[:token]}"
        }

        render json: { gyms: @gyms, pagination: @pagination, status: 200 }, status: 200
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def create
      user = User.authenticate_user(params[:token])
      if user[0] == true
        @user = user[1]

        gym = @user.user_gyms.create(gym_id: params[:gyms][:id])

        if gym.save
          render json: { success: "Successfully added gym!", status: 200 }, status: 200
        else
          render json: { error: "Failed to add gym!", status: 301 }, status: 301
        end

      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def destroy
      user = User.authenticate_user(params[:token])
      if user[0] == true
        @user = user[1]

        gym = @user.user_gyms.where("gym_id = ?", params[:id]).delete_all

        render json: { success: "Successfully deleted gym!", status: 200 }, status: 200
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def search
      user = User.authenticate_user(params[:token])
      if user[0] == true
        @user = user[1]

        total_gyms = 0

        @gyms = []
        if params[:search].present?
          gyms = @user.gyms.where("is_active = true and lower(name) like ?", "%#{params[:search].downcase}%")
          total_gyms = gyms.count
        else
          gyms = Gym.where("is_active = true")
          total_gyms = gyms.count
        end

        gyms = gyms.order("created_at desc").limit(10).offset(params[:off_set])
        gyms.each do |gym|
          @gyms.push({ id: gym.id, name: gym.name, address: gym.address, contact: gym.contact_number })
        end

        off_set = params[:off_set].to_i + 10

        @pagination = {
          gyms: total_gyms,
          off_set: off_set,
          load_more: total_gyms > off_set ? 1 : 0,
          url: "/v1/gyms/search?off_set=#{off_set}&token=#{params[:token]}"
        }

        render json: { gyms: @gyms, pagination: @pagination, status: 200 }, status: 200
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

  end
end