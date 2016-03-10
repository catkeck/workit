if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AKIAJLE5IPFGGDKPUBGA'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['serene-ocean-12528']
  end
end