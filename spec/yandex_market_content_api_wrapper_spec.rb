require 'yandex_market_content_api_wrapper'

require "active_resource_response/http_mock"

describe YandexMarketContentApiWrapper do
	def init_test_http_mock_with_remained_xratelimit
		@test_data  = [ :category => [ 1, "Matz" ] ].to_xml
	  ActiveResource::HttpMock.respond_to do |mock|  
	    mock.get "/v1/category.xml", {}, @test_data, 200, {"X-RateLimit-Method-Remaining" => 0}
	  end
	end
	
	context "Category" do
		it "should sleep for 1 second if header contains X-RateLimit..." do
			init_test_http_mock_with_remained_xratelimit 
			
			old_seconds = DateTime.now.second
			YandexMarketContentApiWrapper::Category.all
			(DateTime.now.second - old_seconds).should == 1
		end
	end
end