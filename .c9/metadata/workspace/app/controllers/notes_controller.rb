{"changed":true,"filter":false,"title":"notes_controller.rb","tooltip":"/app/controllers/notes_controller.rb","value":"class NotesController < ApplicationController\n  before_action :set_note, only: [:show, :edit, :update, :destroy]\n  before_action :authenticate_user!\n  authorize_resource :user\n\n  # GET /notes\n  # GET /notes.json\n  def index\n    @user = User.find(params[:user_id])\n    authorize! :update, @user \n    @notes = current_user.notes\n  end\n\n  # GET /notes/1\n  # GET /notes/1.json\n  def show\n  end\n\n  # GET /notes/new\n  def new\n    @note = current_user.notes.new\n  end\n\n  # GET /notes/1/edit\n  def edit\n  end\n\n  # POST /notes\n  # POST /notes.json\n  def create\n    @note = current_user.notes.new(note_params)\n\n    respond_to do |format|\n      if @note.save\n        format.html { redirect_to action: \"index\"}\n        format.json { render :show, status: :created, location: @note }\n      else\n        format.html { render :new }\n        format.json { render json: @note.errors, status: :unprocessable_entity }\n      end\n    end\n  end\n\n  # PATCH/PUT /notes/1\n  # PATCH/PUT /notes/1.json\n  def update\n    # authorize! :update, @user \n    respond_to do |format|\n      if @note.update(note_params)\n        format.html { redirect_to action: \"index\", notice: 'Note was successfully updated.' }\n        format.json { render :show, status: :ok, location: @note }\n      else\n        format.html { render :edit }\n        format.json { render json: @note.errors, status: :unprocessable_entity }\n      end\n    end\n  end\n\n  # DELETE /notes/1\n  # DELETE /notes/1.json\n  def destroy\n    @note.destroy\n    respond_to do |format|\n      format.html { redirect_to user_notes_url(current_user), notice: 'Nota destuída com sucesso.' }\n      format.json { head :no_content }\n    end\n  end\n\n  private\n    # Use callbacks to share common setup or constraints between actions.\n    def set_note\n      @note = Note.find(params[:id])\n    end\n\n    # Never trust parameters from the scary internet, only allow the white list through.\n    def note_params\n      params.require(:note).permit(:user_id, :title, :description)\n    end\nend\n","undoManager":{"mark":-2,"position":32,"stack":[[{"start":{"row":63,"column":71},"end":{"row":63,"column":102},"action":"remove","lines":["Note was successfully destroyed"],"id":251},{"start":{"row":63,"column":71},"end":{"row":63,"column":72},"action":"insert","lines":["n"]}],[{"start":{"row":63,"column":72},"end":{"row":63,"column":73},"action":"insert","lines":["o"],"id":252}],[{"start":{"row":63,"column":73},"end":{"row":63,"column":74},"action":"insert","lines":["t"],"id":253}],[{"start":{"row":63,"column":74},"end":{"row":63,"column":75},"action":"insert","lines":["a"],"id":254}],[{"start":{"row":63,"column":74},"end":{"row":63,"column":75},"action":"remove","lines":["a"],"id":255}],[{"start":{"row":63,"column":73},"end":{"row":63,"column":74},"action":"remove","lines":["t"],"id":256}],[{"start":{"row":63,"column":72},"end":{"row":63,"column":73},"action":"remove","lines":["o"],"id":257}],[{"start":{"row":63,"column":71},"end":{"row":63,"column":72},"action":"remove","lines":["n"],"id":258}],[{"start":{"row":63,"column":71},"end":{"row":63,"column":72},"action":"insert","lines":["N"],"id":259}],[{"start":{"row":63,"column":72},"end":{"row":63,"column":73},"action":"insert","lines":["o"],"id":260}],[{"start":{"row":63,"column":73},"end":{"row":63,"column":74},"action":"insert","lines":["t"],"id":261}],[{"start":{"row":63,"column":74},"end":{"row":63,"column":75},"action":"insert","lines":["a"],"id":262}],[{"start":{"row":63,"column":75},"end":{"row":63,"column":76},"action":"insert","lines":[" "],"id":263}],[{"start":{"row":63,"column":76},"end":{"row":63,"column":77},"action":"insert","lines":["d"],"id":264}],[{"start":{"row":63,"column":77},"end":{"row":63,"column":78},"action":"insert","lines":["e"],"id":265}],[{"start":{"row":63,"column":78},"end":{"row":63,"column":79},"action":"insert","lines":["s"],"id":266}],[{"start":{"row":63,"column":79},"end":{"row":63,"column":80},"action":"insert","lines":["t"],"id":267}],[{"start":{"row":63,"column":80},"end":{"row":63,"column":81},"action":"insert","lines":["u"],"id":268}],[{"start":{"row":63,"column":81},"end":{"row":63,"column":82},"action":"insert","lines":["í"],"id":269}],[{"start":{"row":63,"column":82},"end":{"row":63,"column":83},"action":"insert","lines":["d"],"id":270}],[{"start":{"row":63,"column":83},"end":{"row":63,"column":84},"action":"insert","lines":["a"],"id":271}],[{"start":{"row":63,"column":84},"end":{"row":63,"column":85},"action":"insert","lines":[" "],"id":272}],[{"start":{"row":63,"column":85},"end":{"row":63,"column":86},"action":"insert","lines":["c"],"id":273}],[{"start":{"row":63,"column":86},"end":{"row":63,"column":87},"action":"insert","lines":["o"],"id":274}],[{"start":{"row":63,"column":87},"end":{"row":63,"column":88},"action":"insert","lines":["m"],"id":275}],[{"start":{"row":63,"column":88},"end":{"row":63,"column":89},"action":"insert","lines":[" "],"id":276}],[{"start":{"row":63,"column":89},"end":{"row":63,"column":90},"action":"insert","lines":["s"],"id":277}],[{"start":{"row":63,"column":90},"end":{"row":63,"column":91},"action":"insert","lines":["u"],"id":278}],[{"start":{"row":63,"column":91},"end":{"row":63,"column":92},"action":"insert","lines":["c"],"id":279}],[{"start":{"row":63,"column":92},"end":{"row":63,"column":93},"action":"insert","lines":["e"],"id":280}],[{"start":{"row":63,"column":93},"end":{"row":63,"column":94},"action":"insert","lines":["s"],"id":281}],[{"start":{"row":63,"column":94},"end":{"row":63,"column":95},"action":"insert","lines":["s"],"id":282}],[{"start":{"row":63,"column":95},"end":{"row":63,"column":96},"action":"insert","lines":["o"],"id":283}]]},"ace":{"folds":[],"scrolltop":660,"scrollleft":0,"selection":{"start":{"row":63,"column":96},"end":{"row":63,"column":96},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":54,"state":"start","mode":"ace/mode/ruby"}},"timestamp":1523520462752}