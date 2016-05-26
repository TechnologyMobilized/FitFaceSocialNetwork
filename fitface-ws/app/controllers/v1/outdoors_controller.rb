module V1
  class OutdoorsController < ActionController::Base

    def index
      user = User.authenticate_user(params[:token])
      if user[0] == true
        @user = user[1]

        outdoor_places = OutdoorPlace.where("is_active = true")
        total_outdoors = outdoor_places.count

        @outdoor_places = []
        outdoor_places = outdoor_places.order("created_at desc").limit(10).offset(params[:off_set])

        outdoor_places.each do |outdoor_place|
          @outdoor_places.push({ id: outdoor_place.id, name: outdoor_place.name, address: outdoor_place.address, is_outdoor: @user.outdoor_places.where("outdoor_places.id = ?", outdoor_place.id).present? ? 1 : 0  })
        end

        off_set = params[:off_set].to_i + 10

        @pagination = {
          outdoor_places: total_outdoors,
          off_set: off_set,
          load_more: total_outdoors > off_set ? 1 : 0,
          url: "/v1/outdoors?off_set#{off_set}&token=#{params[:token]}"
        }

        render json: { outdoor_places: @outdoor_places, pagination: @pagination, status: 200 }, status: 200
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def create
      user = User.authenticate_user(params[:token])
      if user[0] == true
        @user = user[1]

        outdoor_place = @user.user_outdoor_places.create(outdoor_place_id: params[:outdoor_places][:id])

        if outdoor_place.save
          render json: { success: "Successfully added outdoor place!", status: 200 }, status: 200
        else
          render json: { error: "Failed to add outdoor place!", status: 301 }, status: 301
        end

      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def destroy
      user = User.authenticate_user(params[:token])
      if user[0] == true
        @user = user[1]

        outdoor_place = @user.user_outdoor_places.where("outdoor_place_id = ?", params[:id]).delete_all

        render json: { success: "Successfully deleted outdoor place!", status: 200 }, status: 200
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

  end
end