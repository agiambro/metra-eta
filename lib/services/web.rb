require 'net/http'

module Services
  class Web
    def initialize url, basic_auth={user_name: nil, password: nil}, timeout=60
      @url = url
      @uri = URI.parse url
      @basic_auth = basic_auth
      @http = Net::HTTP.new @uri.host, @uri.port
      @http.read_timeout = timeout
      set_ssl!
    end

    def get
      begin
        request = Net::HTTP::Get.new @uri.request_uri
        set_auth! request
        response = @http.request request
        response.body
      rescue => e
        error_handler 'GET', e
      end
    end


    private

    def set_ssl!
      if @uri.is_a? URI::HTTPS
        @http.use_ssl = true
      else
        @http.use_ssl = false
      end
    end

    def set_auth! request
      user_name = @basic_auth[:user_name]
      password  = @basic_auth[:password]

      if user_name && password
        request.basic_auth user_name, password
      end
    end

    def error_handler http_verb, exception
      #Logger.error "Error HTTP #{http_verb}: #{exception.inspect}"
      {}
    end
  end
end
