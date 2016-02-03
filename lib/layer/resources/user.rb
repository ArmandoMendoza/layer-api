module Layer
  module Resources
    class User < Layer::Resource
      def self.find(url, id)
        new({"id" => id, "url" => "users/#{id}"})
      end

      def blocks
        Layer::ResourceProxy.new(self, Layer::Resources::Block)
      end

      def conversations
        Layer::ResourceProxy.new(self, Layer::Resources::Conversation)
      end

      def messages
        Layer::ResourceProxy.new(self, Layer::Resources::Message)
      end
    end
  end
end