class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chatrooms = Chatroom.all
  end

  def create

  end

  def new
    @chatroom = Chatroom.new
  end


  def edit
  end

  def show

  end

  def update

  end

  def destroy
  end

end
