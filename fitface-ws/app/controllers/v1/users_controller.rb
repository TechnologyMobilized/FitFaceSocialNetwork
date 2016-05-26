module V1
  class UsersController < ActionController::Base

    def edit
      user = User.authenticate_user(params[:token])
      if user[0] == true
        user = user[1]
        @user = { name: user.name, email: user.email, age: user.age, gender: user.sex, city: user.city, }
        @security = { question: user.security_question, answer: user.security_answer }

        render json: { user: @user, security: @security }, status: 200
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def update
      user = User.authenticate_user(params[:token])
      if user[0] == true
        @user = user[1]
        @user.update_attributes(params[:user])
        if @user.save
          if params[:preferences].present?
            if params[:preferences] == 0
              @user.user_preferences.delete_all
            else
              preferences = @user.user_preferences.where("turn_on_day NOT IN (?)", params[:preferences]).delete_all
              params[:preferences].each do |preference|
                if @user.user_preferences.where("turn_on_day = ?", preference).present? == false
                  @user.user_preferences.create({ turn_on_day: preference })
                end
              end
            end
          end
          render json: { sucess: "Successfully saved info!", status: 200 }, status: 200
        else
          render json: { error: "Failed to update info!", status: 301 }, status: 301
        end
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def destroy
      user = User.authenticate_user(params[:token])
      if user[0] == true
        user = user[1]

        gyms = user.user_gyms.delete_all
        sports = user.user_sports.delete_all
        outdoor_places = user.user_outdoor_places.delete_all
        events = user.user_events.delete_all
        workouts = user.user_workouts_delete_all
        friendships = user.friendships.delete_all
        blocks = user.blocks.delete_all
        photos = user.photos.delete_all

        if user.delete
          render json: { success: "Successfully deleted account!", status: 200 }, status: 200
        else
          render json: { error: "Failed to delete account!", status: 301 }, status: 301
        end
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def show
      user = User.authenticate_user(params[:token])
      if user[0] == true
        owner = user[1]
        user = User.find_by_id(params[:id])
        
        is_owner = user.access_token == params[:token] ? 1 : 0

        @user = { id: user.id, name: user.name, city: user.city, age: user.age, sex: user.sex, image: "" }
        photos = user.photos.where("is_profile = false").order("created_at").limit(10)
        @photos = []
        photos.each do |photo|
          @photos.push({ id: photo.id, url: photo.image.url })
        end

        @sports = user.sports.select("sports.id, sports.name")

        @memberships = []
        user.gyms.order("created_at desc").each do |gym|
          @memberships.push({ id: gym.id, name: gym.name, address: gym.address, date: gym.date, buds: 0 })
        end

        @outdoors = []
        user.outdoor_places.order("created_at desc").each do |outdoor_place|
          @outdoors.push({ id: outdoor_place.id, name: outdoor_place.name, address: outdoor_place.address, date: outdoor_place.date, buds: 0})
        end

        if is_owner == 1
          render json: { is_owner: is_owner, user: @user, photos: @photos, memberships: @memberships, sports: @sports, places:  @outdoors, achievements: [], status: 200 }, status: 200
        else
          is_friend = owner.friends?(user) == true ? 1 : 0

          render json: { is_owner: is_owner, is_friend: is_friend, user: @user, memberships: @memberships, sports: @sports, places: @outdoors, achievements: [], status: 200 }, status: 200
        end
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def password
      user = User.authenticate_user(params[:token])
      if user[0] == true
        user = user[1]
        
        password = Devise.friendly_token.first(8)
        user.password = password

        @user = { password: password }

        if user.save
          render json: { success: "Successfully saved new password!", user: @user, status: 200 }, status: 200
        else
          render json: { error: "Failed to update password!", status: 301 }, status: 200
        end
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def send_email_password
      user = User.authenticate_user(params[:token])
      if user[0] == true
        user = user[1]
        
        UserMailer.reset_password(user.id, params[:user][:password]).deliver
        
        render json: { success: "New password sent to email!", status: 200 }, status: 200
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def security_question
      user = User.where("device_token = ?", params[:user][:device_token]).last

      if user.present?
        render json: { question: APP_CONFIG['questions'][user.security_question], status: 200 }, status: 200
      else
        render json: { error: "Account not registered!", status: 301 }, status: 301
      end
    end

    def username
      user = User.where("device_token = ?", params[:user][:device_token]).last

      if user.security_answer == params[:user][:answer]
        render json: { username: user.username, status: 200 }, status: 200
      else
        render json: { error: "Sorry, your wrong answer was wrong. Please try again.", status: 301 }, status: 301
      end
    end

    def security
      user = User.authenticate_user(params[:token])
      if user[0] == true
        user = user[1]

        @user = { notify_sms: user.notify_sms? ? 1 : 0, notify_email: user.notify_email? ? 1 : 0 }

        render json: { security: @user, status: 200 }, status: 200
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def notifications
      user = User.authenticate_user(params[:token])
      if user[0] == true
        user = user[1]

        @user = { notify_new_msg: user.notify_new_msg? ? 1 : 0, meet_now: user.meet_now? ? 1 : 0, logged_day: user.logged_day.present? ? user.logged_day : 0, notify_via_app: user.notify_via_app? ? 1 : 0, notify_via_sms: user.notify_via_sms? ? 1 : 0, notify_via_email: user.notify_via_email? ? 1 : 0 } 
        
        render json: { notifications: @user, status: 200 }, status: 200
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def preferences
      user = User.authenticate_user(params[:token])
      if user[0] == true
        user = user[1]

        days = []
        user.user_preferences.select([:id, :turn_on_day]).each do |preference|
          days.push({ id: preference.id, day: preference.turn_on_day})
        end

        @preferences = { turn_off_time: user.turn_off_time, turn_on_start: user.turn_on_start, turn_on_end: user.turn_on_end,  turn_on_days: days}
        
        render json: { preferences: @preferences, status: 200 }, status: 200
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end
  end
end