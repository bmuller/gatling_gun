class GatlingGun
  class ApiCall
    BASE_URL = "https://sendgrid.com/api/newsletter"
    
    def initialize(action, parameters)
      @action     = action
      @parameters = parameters
    end
    
    def response
      url               = URI.parse("#{BASE_URL}/#{@action}.json")
      http              = Net::HTTP.new(url.host, url.port)
      http.use_ssl      = true
      http.verify_mode  = OpenSSL::SSL::VERIFY_PEER
      http.verify_depth = 5
      post              = Net::HTTP::Post.new(url.path)
      post.set_form_data(@parameters)
      Response.new(http.start { |session| session.request(post) })
    rescue Timeout::Error, Errno::EINVAL,        Errno::ECONNRESET,
           EOFError,       Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError,
           Net::ProtocolError => error
      Response.new("error" => error.message)
    end
  end
end
