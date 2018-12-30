class BoardChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'grid_box'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
