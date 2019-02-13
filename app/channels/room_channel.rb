class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params['room_id']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = Message.create! content: data['message'], user: User.find(data['user_id']), room: Room.find(data['room_id'])
    ActionCable.server.broadcast(
      "room_channel_#{data['room_id']}",
      { html: render_message(message),
        sent_by: data['user_id'] }
                            )
  end

  def render_message(message)
    ApplicationController.renderer.render(
      partial: 'messages/message',
      locals: { message: message })
  end
end
