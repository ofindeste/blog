class EditorChannel < ApplicationCable::Channel
  def subscribed
    stream_from "post_#{params[:id]}"
    ActionCable.server.broadcast("post_#{params[:id]}", { message: "ready to edit" })
  end

  def receive(data)
    ActionCable.server.broadcast("post_#{params[:id]}", data)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
