module V1
  class RegistrationsController < Devise::RegistrationsController

    def create
      build_resource
      if resource.save
        sign_in resource

        @user = User.find_by_id(resource.id)

        sign_out resource
        
        @user = { id: user.id, token: user.access_token }

        render json: { user: @user, status: 200 }, status: 200
      else
        render json: { eror: resource.errors.to_a.first.to_s, status: 300 }, status: :unprocessable_entity
      end
    end

  end
end