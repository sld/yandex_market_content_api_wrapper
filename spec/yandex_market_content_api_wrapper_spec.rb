require 'yandex_market_content_api_wrapper'

describe YandexMarketContentApiWrapper do
	def setup
		@test_data  = [ :category => [ 1, "Matz" ] ].to_xml
	  ActiveResource::HttpMock.respond_to do |mock|  
	    mock.get "/v1/category.xml", {}, @test_data
	  end
	end
	

	context "Category" do
		before do 
			setup
		end


		it "should raise timeout error if more than 8 requests per second" do
			10.times{
				sleep(0.01)  
				YandexMarketContentApiWrapper::Category.all
			}
		end
	end
end