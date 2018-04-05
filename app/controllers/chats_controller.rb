class ChatsController < ApplicationController
  before_action :set_chat, only: [:message,:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  authorize_resource

  # GET /chats
  # GET /chats.json
  def index
    @chats = current_user.chats
  end

  # GET /chats/1
  # GET /chats/1.json
  def show
    @messages = @chat.messages.order('created_at ASC')
  end

  # GET /chats/new
  def new
    @chat = Chat.new
  end

  # GET /chats/1/edit
  def edit
  end

  # POST /chats
  # POST /chats.json
  def create
    @chat = current_user.chat_with(params[:user_id].to_i)
    if not @chat.blank?
     redirect_to @chat.first
    else
      
      @chat = Chat.new(chat_params)
      @chat.chat_subscribers.new(user_id: current_user.id)
      @chat.chat_subscribers.new(user_id: params[:user_id])
  
      respond_to do |format|
        if @chat.save
          format.html { redirect_to @chat, notice: 'Chat was successfully created.' }
          format.json { render :show, status: :created, location: @chat }
        else
          format.html { render :new }
          format.json { render json: @chat.errors, status: :unprocessable_entity }
        end
      end
      
    end
  end
  
  def messages
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.new(message_params)
    @message.user_id = current_user.id
    respond_to do |format|
      if @message.save
        format.html { redirect_to @chat, notice: 'Message has been successfully sent' }
        format.json { render :show, status: :ok, location: @chat }
        format.js
      else
        format.html { redirect_to @chat, notice: 'Something went wrong. Please try again' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chats/1
  # PATCH/PUT /chats/1.json
  def update
    respond_to do |format|
      if @chat.update(chat_params)
        format.html { redirect_to @chat, notice: 'Chat was successfully updated.' }
        format.json { render :show, status: :ok, location: @chat }
      else
        format.html { render :edit }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chats/1
  # DELETE /chats/1.json
  def destroy
    @chat.destroy
    respond_to do |format|
      format.html { redirect_to chats_url, notice: 'Chat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chat_params
      params.fetch(:chat, {})
    end
    
    def message_params
      params.require(:message).permit(:content)
    end
end
