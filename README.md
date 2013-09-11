# YandexMarketContentApiWrapper

Yandex.Market content API wrapper. More info about API: http://api.yandex.ru/market/content/

## Installation

Add this line to your application's Gemfile:

    gem 'yandex_market_content_api_wrapper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yandex_market_content_api_wrapper

## Usage

```
require "yandex_market_content_api_wrapper"


YandexMarketContentApiWrapper.api_key = API_KEY

YandexMarketContentApiWrapper::Category.find(2) # v1/category/2.xml
YandexMarketContentApiWrapper::Georegion.find(:all) # v1/georegion.xml
# geo_id = 0 means ALL_REGIONS
YandexMarketContentApiWrapper::Search.search_by( :text => "sword", :geo_id => 0 ) # v1/search.xml?text=sword&geo_id=0
```

If X-RateLimit_s are remained then run sleep for one second.

## TODO

* Add 'children' support to Georegion and Category

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
