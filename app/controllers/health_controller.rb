class HealthController < ApplicationController
    def show
        render json: { ok: true, uptime: uptime + " seconds"}
    end

    def uptime
        uptime = Time.now. - Gagamboy::BOOTED_AT
        
        uptime.to_s
    end
end
