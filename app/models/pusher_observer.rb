class PusherObserver < ActiveRecord::Observer
  observe :post

  def after_create(model)
    channel_name = pusher_channel_name(model)
    Pusher[channel_name].trigger('created',model.to_json)
  end

  def after_update(model)
    channel_name = pusher_channel_name(model)
    Pusher[channel_name].trigger('updated',model.to_json)
  end

  def before_destroy(model)
    channel_name = pusher_channel_name(model)
    Pusher[channel_name].trigger('destroyed',model.to_json)
  end

  def pusher_channel_name(model)
    channel_name = model.class.table_name
  end
end