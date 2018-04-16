{"filter":false,"title":"message_sending_job.rb","tooltip":"/app/jobs/message_sending_job.rb","undoManager":{"mark":14,"position":14,"stack":[[{"start":{"row":1,"column":2},"end":{"row":1,"column":4},"action":"insert","lines":["# "],"id":2}],[{"start":{"row":3,"column":2},"end":{"row":3,"column":4},"action":"insert","lines":["# "],"id":3},{"start":{"row":4,"column":2},"end":{"row":4,"column":4},"action":"insert","lines":["# "]},{"start":{"row":5,"column":2},"end":{"row":5,"column":4},"action":"insert","lines":["# "]}],[{"start":{"row":5,"column":7},"end":{"row":6,"column":0},"action":"insert","lines":["",""],"id":4},{"start":{"row":6,"column":0},"end":{"row":6,"column":2},"action":"insert","lines":["  "]}],[{"start":{"row":6,"column":2},"end":{"row":7,"column":0},"action":"insert","lines":["",""],"id":5},{"start":{"row":7,"column":0},"end":{"row":7,"column":2},"action":"insert","lines":["  "]}],[{"start":{"row":7,"column":2},"end":{"row":8,"column":0},"action":"insert","lines":["",""],"id":6},{"start":{"row":8,"column":0},"end":{"row":8,"column":2},"action":"insert","lines":["  "]}],[{"start":{"row":8,"column":2},"end":{"row":9,"column":0},"action":"insert","lines":["",""],"id":7},{"start":{"row":9,"column":0},"end":{"row":9,"column":2},"action":"insert","lines":["  "]}],[{"start":{"row":9,"column":2},"end":{"row":10,"column":0},"action":"insert","lines":["",""],"id":8},{"start":{"row":10,"column":0},"end":{"row":10,"column":2},"action":"insert","lines":["  "]}],[{"start":{"row":8,"column":2},"end":{"row":19,"column":5},"action":"insert","lines":["queue_as :default","","  def perform(message)","    # Do something later","    ActionCable.server.broadcast \"chat_id_#{message.chat_id}\", {message: render_message(message), sender_type: message.message_sender.class.to_s,sender_id: message.message_sender.id}","  end","  ","  private","   ","  def render_message(message)","      MessagesController.render partial: 'messages/message', locals: { message: message }","  end"],"id":9}],[{"start":{"row":18,"column":6},"end":{"row":18,"column":24},"action":"remove","lines":["MessagesController"],"id":10},{"start":{"row":18,"column":6},"end":{"row":18,"column":27},"action":"insert","lines":["ApplicationController"]}],[{"start":{"row":12,"column":98},"end":{"row":12,"column":145},"action":"remove","lines":["sender_type: message.message_sender.class.to_s,"],"id":11}],[{"start":{"row":12,"column":117},"end":{"row":12,"column":131},"action":"remove","lines":["message_sender"],"id":12},{"start":{"row":12,"column":117},"end":{"row":12,"column":118},"action":"insert","lines":["u"]}],[{"start":{"row":12,"column":118},"end":{"row":12,"column":119},"action":"insert","lines":["s"],"id":13}],[{"start":{"row":12,"column":119},"end":{"row":12,"column":120},"action":"insert","lines":["e"],"id":14}],[{"start":{"row":12,"column":120},"end":{"row":12,"column":121},"action":"insert","lines":["r"],"id":15}],[{"start":{"row":12,"column":121},"end":{"row":12,"column":122},"action":"remove","lines":["."],"id":16},{"start":{"row":12,"column":121},"end":{"row":12,"column":122},"action":"insert","lines":["_"]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":12,"column":49},"end":{"row":12,"column":49},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":true,"wrapToView":true},"firstLineState":0},"timestamp":1522924846044,"hash":"308fce1d74bf26f07f2bf618dcb30113d3f5fedb"}