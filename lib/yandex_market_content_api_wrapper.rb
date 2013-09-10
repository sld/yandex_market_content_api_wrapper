require "yandex_market_content_api_wrapper/version"
require 'active_resource'
require 'yandex_market_content_api_wrapper/yandex_market'
require 'yandex_market_content_api_wrapper/category'
require 'yandex_market_content_api_wrapper/georegion'
require 'yandex_market_content_api_wrapper/search'

module YandexMarketContentApiWrapper

  def self.api_key=(key)
    YandexMarket.api_key = key
  end

end
