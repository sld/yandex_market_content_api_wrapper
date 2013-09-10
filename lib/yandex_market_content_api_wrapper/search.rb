module YandexMarketContentApiWrapper
  class Search < YandexMarket
    @collection_name = "search"


    def self.search_by params={:geo_id => nil, :text => nil}
      raise ArgumentError.new(":geo_id and :text should passed!") if (params[:geo_id].nil? && params[:text].nil?)

      find :all, :params => params
    end
  end
end
