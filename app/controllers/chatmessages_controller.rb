class ChatmessagesController < ApplicationController
  before_action :authenticate_user!, :only => [:index, :update, :join]

  def index
  end

  def show
  end

  def join
    @chatroom_user = @chatroom.room_users.where(user_id: current_user.id).first_or_create
    redirect_to @chatroom

  end

  def update
  end

  def distroy
  end
end
