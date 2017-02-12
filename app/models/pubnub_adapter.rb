class PubnubAdapter

  pubnub = Pubnub.new(
    :subscribe_key  => ENV['PUBNUB_SUBSCRIBE_KEY'],
    :publish_key => ENV['PUBNUB_PUBLISH_KEY']
  )

  class << self
    attr_reader :subscribed

    def subscribe(channel, &block)
      @pubnub.subscribe :channel  => channel, &block
    end

    def publish(message, channel)
      @pubnub.publish :channel  => channel, :message => message do
        puts 'Message sent'
      end
    end

    def unsubscribe(channel, &block)
      @pubnub.unsubscribe :channel  => channel, &block
    end

  end

end
