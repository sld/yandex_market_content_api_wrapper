module YandexMarketContentApiWrapper
  class YandexMarket < ActiveResource::Base
    API_SITE = URI::parse("https://api.content.market.yandex.ru")
    API_PREFIX = "/v1/"

    self.site = API_SITE
    self.prefix = API_PREFIX
    self.format = :xml

    # Задание Api key и Referer'a. Необходимы для работы с Яндекс Услугами
    @@api_key = ""
    @@referer = ""


    add_response_method :http_response


    class << self
      # Если headers не заданы в подклассе, то назначаем ему
      # headers суперкласса
      def headers
        if defined?(@headers)
          @headers
        elsif superclass != Object && superclass.headers
          superclass.headers
        else
          @headers ||= {}
        end
      end


      def api_key
        @@api_key
      end


      def api_key=(key)
        @@api_key = key
        use_api_key
      end


      def referer
        @@referer
      end


      def referer=(referer_site)
        @@referer = referer_site
        use_referer_site
      end


      def find *args
        found = super *args
        try_rps_restrictions
        return found
      end

    end


    private


    def self.use_api_key
      self.headers['Authorization'] = @@api_key
    end


    def self.use_referer_site
      self.headers['Referer'] = @@referer
    end


    # http://api.yandex.ru/market/content/doc/dg/concepts/limits.xml
    # If limits remained then sleep for 1 second
    def self.try_rps_restrictions
      # http_response.headers keys are symbolized for activeresource-response Gem
      global_limit = self.http_response.headers[:x_ratelimit_global_limit]
      global_remaining = self.http_response.headers[:x_ratelimit_global_remaining]
      method_limit = self.http_response.headers[:x_ratelimit_method_limit]
      method_remaining = self.http_response.headers[:x_ratelimit_method_remaining]

      if method_remaining == 0 || global_remaining == 0
        sleep 1 
      end  
    end

  end
end