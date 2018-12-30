App.board = App.cable.subscriptions.create "BoardChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    if data
      box = $("td.js-fill-color[data-position='#{data.position}']");
      $(box).css("background-color", data.color).attr("title", data.details)
