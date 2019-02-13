$(document).on 'channels_room_create_subscriptions', ->
  room_id = $('[data-room-id]').data("room-id")
  App.room = App.cable.subscriptions.create { channel: "RoomChannel", room_id: room_id },
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      alert("sent_by:#{data['sent_by']}")
      $('ul.messages').append(data['html'])

    speak: (message, user_id, room_id) ->
      @perform 'speak', { message: message, user_id: user_id, room_id: room_id }

  $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
    if event.keyCode is 13 # return = send
      room_id = $('[data-room-id]').data("room-id")
      user_id = $('#user_id').val()
      App.room.speak(event.target.value, user_id, room_id)
      event.target.value = ''
      event.preventDefault()
