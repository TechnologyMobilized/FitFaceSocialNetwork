module V1
  class SessionsController < Devise::SessionsController

    def create
      user = User.where("lower(username) = :value or lower(email) = :value", { value: params[:user][:account].downcase })
      if user.present?
        resource = warden.authenticate!(scope: resource_name, recall: "#{controller_path}#failure")
        sign_in_and_redirect(resource_name, resource)

        if user.device_token != params[:user][:device_token]
          if user.notify_email?
            UserMailer.notify_login(user.id, params[:user][:device_token]).deliver
          end

          if user.notify_sms?
            
          end
        end

      else
        render json: { error: "You are not register on FitFace", status: 300 }, status: 300
      end      
    end

    def failure
      return render json: { error: "Error with your login or password.", status: 300}, status: 300
    end

    private
      def sign_in_and_redirect(resource_or_scope, resource=nil)
        scope = Devise::Mapping.find_scope!(resource_or_scope)
        resource ||= resource_or_scope
        sign_in(scope, resource) unless warden.user(scope) == resource
        
        user = User.find_by_id(resource.id)

        sign_out resource

        @user = { id: user.id, token: user.access_token }
        return render json: { user: @user, status: 200 }, status: 200
      end
  end
end