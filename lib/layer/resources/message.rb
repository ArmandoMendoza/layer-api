module Layer
  module Resources
    class Message < Layer::Resource
      def destroy
        client.delete(delete_url)
      end

      def update_parts(params)
        client.put(
          update_parts_url,
          body: params.to_json
        )
      end

      private

      def update_parts_url
        conversation_url = conversation["id"].split("layer:///").last
        "#{conversation_url}/messages/#{uuid}/parts"
      end

      def delete_url
        conversation_url = conversation["id"].split("layer:///").last

        "#{conversation_url}/messages/#{uuid}"
      end
    end
  end
end
