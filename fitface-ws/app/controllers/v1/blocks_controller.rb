module V1
  class BlocksController < ActionController::Base

    def index
      user = User.authenticate_user(params[:token])
      if user[0] == true
        owner = user[1]

        blocks = owner.blocks.where("is_report = false")
        total_blocks = blocks.count

        blocks = owner.blocks.order("created_at desc").limit(10).offset(params[:off_set])
        @users = []

        blocks.each do |block|
          user = block.report
          @users.push({ id: user.id, name: user.name, image: "", age: user.age, gender: APP_CONFIG['gender'][user.sex] })
        end

        off_set = params[:off_set].to_i + 10

        @pagination = {
          blocks: total_blocks,
          off_set: off_set,
          load_more: total_blocks > off_set ? 1 : 0,
          url: "/v1/blocks?off_set=#{off_set}&token=#{params[:token]}"
        }

        render json: { users: @users, pagination: @pagination, status: 200 }, status: 200
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def create
      user = User.authenticate_user(params[:token])
      if user[0] == true
        owner = user[1]
        user = User.find_by_id(params[:user_id])

        if owner.blocked?(user, params[:is_blocked]) == false
          owner.block(user, params[:is_blocked])

          render json: { success: "User blocked!", status: 200 }, status: 200
        else
          render json: { success: "User already blocked!", status: 301 }, status: 301
        end
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def destroy
      user = User.authenticate_user(params[:token])
      if user[0] == true
        owner = user[1]
        owner.blocks.where("report_id = ?", params[:id]).delete_all

        if owner.blocks.count > 10
          block = owner.blocks.where("is_report = false").order("created_at desc").limit(1).offset(params[:off_set]).last

          user = block.report
          @user = { id: user.id, name: user.name, image: "", age: user.age, gender: APP_CONFIG['gender'][user.sex] }
          
          render json: { success: "Successfully unblocked user!", user: @user, status: 200 }, status: 200
        else
          render json: { success: "Successfully unblocked user!", status: 201 }, status: 200
        end
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end
  end
end