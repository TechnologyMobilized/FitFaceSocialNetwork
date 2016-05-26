module V1
  class PartnersController < ActionController::Base

    def index
      user = User.authenticate_user(params[:token])
      if user[0] == true
        user = user[1]

        partners = user.partners
        total_partners = partners.count

        partners = partners.order("created_at desc").limit(10).offset(params[:off_set])
        @partners = []

        off_set = params[:off_set].to_i + 10

        partners.each do |partner|
          @partners.push({ id: partner.id, name: partner.name, image: "", age: partner.age, gender: APP_CONFIG['gender'][partner.sex] })
        end

        @pagination = {
          sports: total_partners,
          off_set: off_set,
          load_more: total_partners > off_set ? 1 : 0,
          url: v1_partners_path(off_set: off_set, token: params[:token])
        }

        render json: { partners: @partners, pagination: @pagination, status: 200 }, status: 200
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def create
      user = User.authenticate_user(params[:token])
      if user[0] == true
        owner = user[1]
        user = User.find_by_id(params[:user_id])

        if owner.friends?(user) == true
          render json: { success: "You are already fitness partner with #{user.name}!", status: 301 }, status: 301
        else
          owner.friend(user)

          render json: { success: "Successfully added #{user.name} as your fitness partner!", status: 200 }, status: 200
        end
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def destroy
      user = User.authenticate_user(params[:token])
      if user[0] == true
        owner = user[1]
        user = User.find_by_id(params[:id])

        owner.unfriend(user)
        
        if owner.partners.count > 10
          user = owner.partners.order("created_at desc").limit(1).offset(params[:off_set]).last
          @user = { id: user.id, name: user.name, image: "", age: user.age, gender: APP_CONFIG['gender'][user.sex] }
          
          render json: { success: "Removed #{user.name} as your fitness partner!", user: @user, status: 200 }, status: 200
        else
          render json: { success: "Removed #{user.name} as your fitness partner!", status: 201 }, status: 200
        end
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end
  end
end