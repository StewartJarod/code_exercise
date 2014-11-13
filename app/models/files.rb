class Files
  class << self
    def all
      @s3 = connection
      aggregate_objects.flatten
    end

    private

    def aggregate_objects
      @s3.buckets[ENV["AWS_BUCKET"]].objects.map do |object|
        object.read.lines.map do |line|
          key, value = line.split "\t", 2
          {filename: object.key, key: key.strip, value: value.strip}
        end
      end
    end

    def connection
      AWS::S3.new(
        access_key_id: ENV["AWS_ACCESS_KEY_ID"],
        secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
      )
    end
  end
end
