module V1
  class PhotosController < ActionController::Base

    def index
      user = User.authenticate_user(params[:token])
      if user[0] == true
        user = user[1]
        @photos = []

        photos = user.photos.where("is_profile = false").order("created_at").limit(10).offset(params[:off_set])
        photos.each do |photo|
          @photos.push({ id: photo.id, image: photo.image.url })
        end

        render json: { photos: @photos, status: 200 }, status: 200
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def create
      user = User.authenticate_user(params[:token])
      if user[0] == true
        user = user[1]
        photo = user.photos.create(params[:photos])

        if photo.save
          render json: { photo: photo.image, status: 200 }, status: 200
        else
          render json: { error: "Failed to upload image!", status: 301 }, status: 301
        end
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def destroy
      user = User.authenticate_user(params[:token])
      if user[0] == true
        photo = Photo.find_by_id(params[:id])
        photo.image.delete!
        photo.destroy

        render json: { success: "Successfully deleted photo!", status: 200 }, status: 200
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

  end
end