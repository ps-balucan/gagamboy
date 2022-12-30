class ApplicationController < ActionController::Base
    before_action :authorize

    def authorize
        @headers = request.headers

        unless @headers['Authorization'].present? && tokenValid?
            head :forbidden
        end
    end

    private
    def tokenValid?
        token = @headers['Authorization'].gsub('Bearer ', '')
        
        unless token
            return false
        end

        begin
            decoded_token = JWT.decode(token, ENV['SUPABASE_KEY'], true, { algorithm: 'HS256' })
            return true
        rescue JWT::DecodeError
            Rails.logger.warn("JWT was unable to be decoded.")
        end

        false
    end
end
