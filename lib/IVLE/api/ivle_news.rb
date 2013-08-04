module IVLE
  module IVLENews
    def public_news(title_only=false)
      api 'PublicNews', titleonly: title_only
    end
  end
end
