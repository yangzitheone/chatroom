class ChatmessageController < ApplicationController
  before_action :authenticate_user!, :only => [:index, :update]

  def index

  end

  def show
  end

  def update
  end

  def distroy
  end
end
