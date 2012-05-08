
describe "Http_Error_Log 'file'" do
  
  it "turns file into an Array" do
    NGINX_ERROR_LOG
    .should.is_a Array
  end

  it "defines keys as symbols: client server request upstream host referrer created_at error msg" do
    %w{ 
    client server request upstream host referrer created_at error msg
    }.each { |k|
      NGINX_ERROR_LOG.first.should.has_key k.to_sym
    }
  end

  it "sets key: :created_at" do
    key_should_be :created_at, Time.parse('2012/01/01 01:01:01')
  end

  it "sets key: :client" do
    key_should_be :client, '11.11.11.11'
  end
  
  it "sets key: :server" do
    key_should_be :server, 'test.test.com'
  end

  it "sets key: :host" do
    key_should_be :host, '"www.test.com"'
  end
  
  it "sets key: :request" do
    key_should_be :request, "GET /stylesheets/en-us/, , .css?time=1286211794 HTTP/1.1".inspect
  end

  it "sets key: :referrer" do
    key_should_be :referrer, '"http://www.test.com/"'
  end

  it "sets key: :upstream" do
    key_should_be :upstream, "http://127.0.0.1:4567/test/en-us/Test-Page.css?time=1234.5678".inspect
  end
  
  it "sets key: :line" do
    key_should_be :line, 1
    NGINX_ERROR_LOG[1][:line]
    .should == 2
  end
  
  it "sets key: :msg" do
    key_should_be :msg, "*183 connect() failed (111: Connection refused) while connecting to upstream"
  end
  
  it "sets key: :error" do
    key_should_be :error, "[error] 11563#0"
  end
  
  it "returns an empty array if file is empty" do
    EMPTY_LOG
    .should == []
  end

end # === Http_Error_Log 'file'

describe "Http_Error_Log :file, \"date time\"" do
  
  it "skips all entries that come after a specified" do
    target = NGINX_ERROR_LOG[1, NGINX_ERROR_LOG.size]
    Http_Error_Log("spec/file/nginx.error.log", "2012/01/01 01:01:01 ")
    .should == target
  end
  
end # === Http_Error_Log :file, \"skip\"

