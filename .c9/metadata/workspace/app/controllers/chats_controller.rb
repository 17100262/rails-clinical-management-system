{"changed":true,"filter":false,"title":"chats_controller.rb","tooltip":"/app/controllers/chats_controller.rb","value":"class ChatsController < ApplicationController\n  before_action :set_chat, only: [:message,:show, :edit, :update, :destroy]\n  before_action :authenticate_user!\n  authorize_resource\n\n  # GET /chats\n  # GET /chats.json\n  def index\n    all_messages = []\n    current_user.chats.includes(:messages).each do |chat|\n      all_messages << chat.messages.order('created_at ASC').last\n    end\n    # if \n    @chats = all_messages.compact.sort_by{|a| a.created_at }.reverse.map(&:chat)\n    \n  end\n\n  # GET /chats/1\n  # GET /chats/1.json\n  def show\n    @messages = @chat.messages.order('created_at ASC')\n    @messages.where.not(user_id: current_user.id).update_all(read: true)\n  end\n\n  # GET /chats/new\n  def new\n    @chat = Chat.new\n  end\n\n  # GET /chats/1/edit\n  def edit\n  end\n\n  # POST /chats\n  # POST /chats.json\n  def create\n    @chat = current_user.chat_with(params[:user_id].to_i)\n    if not @chat.blank?\n     redirect_to @chat.first\n    else\n      \n      @chat = Chat.new(chat_params)\n      @chat.chat_subscribers.new(user_id: current_user.id)\n      @chat.chat_subscribers.new(user_id: params[:user_id])\n  \n      respond_to do |format|\n        if @chat.save\n          format.html { redirect_to @chat, notice: 'Chat iniciado com sucesso.' }\n          format.json { render :show, status: :created, location: @chat }\n        else\n          format.html { render :new }\n          format.json { render json: @chat.errors, status: :unprocessable_entity }\n        end\n      end\n      \n    end\n  end\n  \n  def messages\n    @chat = Chat.find(params[:chat_id])\n    @message = @chat.messages.new(message_params)\n    @message.user_id = current_user.id\n    respond_to do |format|\n      if @message.save\n        format.html { redirect_to @chat, notice: 'Mensagem enviada com sucesso' }\n        format.json { render :show, status: :ok, location: @chat }\n        format.js\n      else\n        format.html { redirect_to @chat, notice: 'Erro inesperado. Por favor tente novamente' }\n        format.json { render json: @message.errors, status: :unprocessable_entity }\n      end\n    end\n  end\n\n  # PATCH/PUT /chats/1\n  # PATCH/PUT /chats/1.json\n  def update\n    respond_to do |format|\n      if @chat.update(chat_params)\n        format.html { redirect_to @chat, notice: 'Chat actualizado com sucesso.' }\n        format.json { render :show, status: :ok, location: @chat }\n      else\n        format.html { render :edit }\n        format.json { render json: @chat.errors, status: :unprocessable_entity }\n      end\n    end\n  end\n\n  # DELETE /chats/1\n  # DELETE /chats/1.json\n  def destroy\n    @chat.destroy\n    respond_to do |format|\n      format.html { redirect_to chats_url, notice: 'Chat destruido com sucesso.' }\n      format.json { head :no_content }\n    end\n  end\n\n  private\n    # Use callbacks to share common setup or constraints between actions.\n    def set_chat\n      @chat = Chat.find(params[:id])\n    end\n\n    # Never trust parameters from the scary internet, only allow the white list through.\n    def chat_params\n      params.fetch(:chat, {})\n    end\n    \n    def message_params\n      params.require(:message).permit(:content)\n    end\nend\n","undoManager":{"mark":-130,"position":100,"stack":[[{"start":{"row":68,"column":62},"end":{"row":68,"column":63},"action":"remove","lines":["d"],"id":476}],[{"start":{"row":68,"column":62},"end":{"row":68,"column":63},"action":"insert","lines":["a"],"id":477}],[{"start":{"row":68,"column":63},"end":{"row":68,"column":64},"action":"insert","lines":["d"],"id":478}],[{"start":{"row":68,"column":64},"end":{"row":68,"column":65},"action":"insert","lines":["o"],"id":479}],[{"start":{"row":68,"column":67},"end":{"row":68,"column":83},"action":"remove","lines":["Please try again"],"id":480},{"start":{"row":68,"column":67},"end":{"row":68,"column":68},"action":"insert","lines":["P"]}],[{"start":{"row":68,"column":68},"end":{"row":68,"column":69},"action":"insert","lines":["o"],"id":481}],[{"start":{"row":68,"column":69},"end":{"row":68,"column":70},"action":"insert","lines":["r"],"id":482}],[{"start":{"row":68,"column":70},"end":{"row":68,"column":71},"action":"insert","lines":[" "],"id":483}],[{"start":{"row":68,"column":71},"end":{"row":68,"column":72},"action":"insert","lines":["f"],"id":484}],[{"start":{"row":68,"column":72},"end":{"row":68,"column":73},"action":"insert","lines":["a"],"id":485}],[{"start":{"row":68,"column":73},"end":{"row":68,"column":74},"action":"insert","lines":["v"],"id":486}],[{"start":{"row":68,"column":74},"end":{"row":68,"column":75},"action":"insert","lines":["o"],"id":487}],[{"start":{"row":68,"column":75},"end":{"row":68,"column":76},"action":"insert","lines":["r"],"id":488}],[{"start":{"row":68,"column":76},"end":{"row":68,"column":77},"action":"insert","lines":[" "],"id":489}],[{"start":{"row":68,"column":77},"end":{"row":68,"column":78},"action":"insert","lines":["t"],"id":490}],[{"start":{"row":68,"column":78},"end":{"row":68,"column":79},"action":"insert","lines":["e"],"id":491}],[{"start":{"row":68,"column":79},"end":{"row":68,"column":80},"action":"insert","lines":["n"],"id":492}],[{"start":{"row":68,"column":80},"end":{"row":68,"column":81},"action":"insert","lines":["t"],"id":493}],[{"start":{"row":68,"column":81},"end":{"row":68,"column":82},"action":"insert","lines":["e"],"id":494}],[{"start":{"row":68,"column":82},"end":{"row":68,"column":83},"action":"insert","lines":[" "],"id":495}],[{"start":{"row":68,"column":83},"end":{"row":68,"column":84},"action":"insert","lines":["n"],"id":496}],[{"start":{"row":68,"column":84},"end":{"row":68,"column":85},"action":"insert","lines":["o"],"id":497}],[{"start":{"row":68,"column":85},"end":{"row":68,"column":86},"action":"insert","lines":["v"],"id":498}],[{"start":{"row":68,"column":86},"end":{"row":68,"column":87},"action":"insert","lines":["a"],"id":499}],[{"start":{"row":68,"column":87},"end":{"row":68,"column":88},"action":"insert","lines":["m"],"id":500}],[{"start":{"row":68,"column":88},"end":{"row":68,"column":89},"action":"insert","lines":["e"],"id":501}],[{"start":{"row":68,"column":89},"end":{"row":68,"column":90},"action":"insert","lines":["n"],"id":502}],[{"start":{"row":68,"column":90},"end":{"row":68,"column":91},"action":"insert","lines":["t"],"id":503}],[{"start":{"row":68,"column":91},"end":{"row":68,"column":92},"action":"insert","lines":["e"],"id":504}],[{"start":{"row":79,"column":50},"end":{"row":79,"column":79},"action":"remove","lines":["Chat was successfully updated"],"id":505},{"start":{"row":79,"column":50},"end":{"row":79,"column":51},"action":"insert","lines":["C"]}],[{"start":{"row":79,"column":51},"end":{"row":79,"column":52},"action":"insert","lines":["h"],"id":506}],[{"start":{"row":79,"column":52},"end":{"row":79,"column":53},"action":"insert","lines":["a"],"id":507}],[{"start":{"row":79,"column":53},"end":{"row":79,"column":54},"action":"insert","lines":["t"],"id":508}],[{"start":{"row":79,"column":54},"end":{"row":79,"column":55},"action":"insert","lines":[" "],"id":509}],[{"start":{"row":79,"column":55},"end":{"row":79,"column":56},"action":"insert","lines":["a"],"id":510}],[{"start":{"row":79,"column":56},"end":{"row":79,"column":57},"action":"insert","lines":["c"],"id":511}],[{"start":{"row":79,"column":57},"end":{"row":79,"column":58},"action":"insert","lines":["t"],"id":512}],[{"start":{"row":79,"column":58},"end":{"row":79,"column":59},"action":"insert","lines":["i"],"id":513}],[{"start":{"row":79,"column":59},"end":{"row":79,"column":60},"action":"insert","lines":["a"],"id":514}],[{"start":{"row":79,"column":60},"end":{"row":79,"column":61},"action":"insert","lines":["l"],"id":515}],[{"start":{"row":79,"column":61},"end":{"row":79,"column":62},"action":"insert","lines":["i"],"id":516}],[{"start":{"row":79,"column":62},"end":{"row":79,"column":63},"action":"insert","lines":["z"],"id":517}],[{"start":{"row":79,"column":63},"end":{"row":79,"column":64},"action":"insert","lines":["a"],"id":518}],[{"start":{"row":79,"column":63},"end":{"row":79,"column":64},"action":"remove","lines":["a"],"id":519}],[{"start":{"row":79,"column":62},"end":{"row":79,"column":63},"action":"remove","lines":["z"],"id":520}],[{"start":{"row":79,"column":61},"end":{"row":79,"column":62},"action":"remove","lines":["i"],"id":521}],[{"start":{"row":79,"column":60},"end":{"row":79,"column":61},"action":"remove","lines":["l"],"id":522}],[{"start":{"row":79,"column":59},"end":{"row":79,"column":60},"action":"remove","lines":["a"],"id":523}],[{"start":{"row":79,"column":58},"end":{"row":79,"column":59},"action":"remove","lines":["i"],"id":524}],[{"start":{"row":79,"column":58},"end":{"row":79,"column":59},"action":"insert","lines":["u"],"id":525}],[{"start":{"row":79,"column":59},"end":{"row":79,"column":60},"action":"insert","lines":["a"],"id":526}],[{"start":{"row":79,"column":60},"end":{"row":79,"column":61},"action":"insert","lines":["l"],"id":527}],[{"start":{"row":79,"column":61},"end":{"row":79,"column":62},"action":"insert","lines":["i"],"id":528}],[{"start":{"row":79,"column":62},"end":{"row":79,"column":63},"action":"insert","lines":["z"],"id":529}],[{"start":{"row":79,"column":63},"end":{"row":79,"column":64},"action":"insert","lines":["a"],"id":530}],[{"start":{"row":79,"column":64},"end":{"row":79,"column":65},"action":"insert","lines":["d"],"id":531}],[{"start":{"row":79,"column":65},"end":{"row":79,"column":66},"action":"insert","lines":["f"],"id":532}],[{"start":{"row":79,"column":66},"end":{"row":79,"column":67},"action":"insert","lines":["o"],"id":533}],[{"start":{"row":79,"column":66},"end":{"row":79,"column":67},"action":"remove","lines":["o"],"id":534}],[{"start":{"row":79,"column":65},"end":{"row":79,"column":66},"action":"remove","lines":["f"],"id":535}],[{"start":{"row":79,"column":65},"end":{"row":79,"column":66},"action":"insert","lines":["o"],"id":536}],[{"start":{"row":79,"column":66},"end":{"row":79,"column":67},"action":"insert","lines":[" "],"id":537}],[{"start":{"row":79,"column":67},"end":{"row":79,"column":68},"action":"insert","lines":["c"],"id":538}],[{"start":{"row":79,"column":68},"end":{"row":79,"column":69},"action":"insert","lines":["o"],"id":539}],[{"start":{"row":79,"column":69},"end":{"row":79,"column":70},"action":"insert","lines":["m"],"id":540}],[{"start":{"row":79,"column":70},"end":{"row":79,"column":71},"action":"insert","lines":[" "],"id":541}],[{"start":{"row":79,"column":71},"end":{"row":79,"column":72},"action":"insert","lines":["s"],"id":542}],[{"start":{"row":79,"column":72},"end":{"row":79,"column":73},"action":"insert","lines":["u"],"id":543}],[{"start":{"row":79,"column":73},"end":{"row":79,"column":74},"action":"insert","lines":["c"],"id":544}],[{"start":{"row":79,"column":74},"end":{"row":79,"column":75},"action":"insert","lines":["e"],"id":545}],[{"start":{"row":79,"column":75},"end":{"row":79,"column":76},"action":"insert","lines":["s"],"id":546}],[{"start":{"row":79,"column":76},"end":{"row":79,"column":77},"action":"insert","lines":["s"],"id":547}],[{"start":{"row":79,"column":77},"end":{"row":79,"column":78},"action":"insert","lines":["o"],"id":548}],[{"start":{"row":93,"column":52},"end":{"row":93,"column":83},"action":"remove","lines":["Chat was successfully destroyed"],"id":549},{"start":{"row":93,"column":52},"end":{"row":93,"column":53},"action":"insert","lines":["C"]}],[{"start":{"row":93,"column":53},"end":{"row":93,"column":54},"action":"insert","lines":["h"],"id":550}],[{"start":{"row":93,"column":54},"end":{"row":93,"column":55},"action":"insert","lines":["a"],"id":551}],[{"start":{"row":93,"column":55},"end":{"row":93,"column":56},"action":"insert","lines":["t"],"id":552}],[{"start":{"row":93,"column":56},"end":{"row":93,"column":57},"action":"insert","lines":[" "],"id":553}],[{"start":{"row":93,"column":57},"end":{"row":93,"column":58},"action":"insert","lines":["d"],"id":554}],[{"start":{"row":93,"column":58},"end":{"row":93,"column":59},"action":"insert","lines":["e"],"id":555}],[{"start":{"row":93,"column":59},"end":{"row":93,"column":60},"action":"insert","lines":["s"],"id":556}],[{"start":{"row":93,"column":60},"end":{"row":93,"column":61},"action":"insert","lines":["t"],"id":557}],[{"start":{"row":93,"column":61},"end":{"row":93,"column":62},"action":"insert","lines":["r"],"id":558}],[{"start":{"row":93,"column":62},"end":{"row":93,"column":63},"action":"insert","lines":["o"],"id":559}],[{"start":{"row":93,"column":63},"end":{"row":93,"column":64},"action":"insert","lines":["i"],"id":560}],[{"start":{"row":93,"column":64},"end":{"row":93,"column":65},"action":"insert","lines":["d"],"id":561}],[{"start":{"row":93,"column":65},"end":{"row":93,"column":66},"action":"insert","lines":["o"],"id":562}],[{"start":{"row":93,"column":66},"end":{"row":93,"column":67},"action":"insert","lines":[" "],"id":563}],[{"start":{"row":93,"column":67},"end":{"row":93,"column":68},"action":"insert","lines":["c"],"id":564}],[{"start":{"row":93,"column":68},"end":{"row":93,"column":69},"action":"insert","lines":["o"],"id":565}],[{"start":{"row":93,"column":69},"end":{"row":93,"column":70},"action":"insert","lines":["m"],"id":566}],[{"start":{"row":93,"column":70},"end":{"row":93,"column":71},"action":"insert","lines":[" "],"id":567}],[{"start":{"row":93,"column":71},"end":{"row":93,"column":72},"action":"insert","lines":["s"],"id":568}],[{"start":{"row":93,"column":72},"end":{"row":93,"column":73},"action":"insert","lines":["u"],"id":569}],[{"start":{"row":93,"column":73},"end":{"row":93,"column":74},"action":"insert","lines":["c"],"id":570}],[{"start":{"row":93,"column":74},"end":{"row":93,"column":75},"action":"insert","lines":["e"],"id":571}],[{"start":{"row":93,"column":75},"end":{"row":93,"column":76},"action":"insert","lines":["s"],"id":572}],[{"start":{"row":93,"column":76},"end":{"row":93,"column":77},"action":"insert","lines":["s"],"id":573}],[{"start":{"row":93,"column":77},"end":{"row":93,"column":78},"action":"insert","lines":["o"],"id":574}],[{"start":{"row":93,"column":62},"end":{"row":93,"column":63},"action":"remove","lines":["o"],"id":575}],[{"start":{"row":93,"column":62},"end":{"row":93,"column":63},"action":"insert","lines":["u"],"id":576}]]},"ace":{"folds":[],"scrolltop":900,"scrollleft":0,"selection":{"start":{"row":98,"column":9},"end":{"row":98,"column":9},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1523297205728}