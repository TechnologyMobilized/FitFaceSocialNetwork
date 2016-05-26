module V1
  class EventsController < ActionController::Base

    def index
      user = User.authenticate_user(params[:token])
      if user[0] == true
        @user = user[1]

        events = Event.where("is_active = true")
        total_events = events.count

        @events = []
        events = events.order("created_at desc").limit(10).offset(params[:off_set])

        events.each do |event|
          @events.push({ id: event.id, name: event.name, address: event.address, date: "", is_event: @user.events.where("events.id = ?", event.id).present? ? 1 : 0  })
        end

        off_set = params[:off_set].to_i + 10

        @pagination = {
          events: total_events,
          off_set: off_set,
          load_more: total_events > off_set ? 1 : 0,
          url: v1_events_path(off_set: off_set, token: params[:token])
        }

        render json: { events: @events, pagination: @pagination, status: 200 }, status: 200
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def create
      user = User.authenticate_user(params[:token])
      if user[0] == true
        @user = user[1]

        event = @user.user_events.create(event_id: params[:events][:id])

        if event.save
          render json: { success: "Successfully added event!", status: 200 }, status: 200
        else
          render json: { error: "Failed to add event!", status: 301 }, status: 301
        end

      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

    def destroy
      user = User.authenticate_user(params[:token])
      if user[0] == true
        @user = user[1]

        event = @user.user_events.where("event_id = ?", params[:id]).delete_all

        render json: { success: "Successfully deleted event!", status: 200 }, status: 200
      else
        render json: { error: "You are not authorized to perform this action!", status: 300 }, status: 300
      end
    end

  end
end