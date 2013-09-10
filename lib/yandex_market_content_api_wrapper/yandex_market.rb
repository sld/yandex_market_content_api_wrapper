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
        super *args
        check_rps_restrictions
      end

    end


    private


    def self.use_api_key
      self.headers['Authorization'] = @@api_key
    end


    def self.use_referer_site
      self.headers['Referer'] = @@referer
    end


    def self.check_rps_restrictions
      puts "Explain method for check rps restrictions http://api.yandex.ru/market/content/doc/dg/concepts/limits.xml"
    end

  end
end