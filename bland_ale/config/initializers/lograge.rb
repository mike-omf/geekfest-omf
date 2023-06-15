# frozen_string_literal: true

require 'lograge/sql/extension'

LOGRAGE_EXCEPTIONS = [].freeze

Rails.application.configure do
  config.lograge.enabled = true
  config.lograge.formatter = Lograge::Formatters::Logstash.new
  config.lograge.custom_options =
    lambda do |event|
      payload = event.payload

      {
        # DEPRECATION WARNING: `Module#parent_name` has been renamed to `module_parent_name`. `parent_name`
        #                       is deprecated and will be removed in Rails 6.1.
        # application: Rails.application.class.parent_name,
        application: Rails.application.class.parent_name,
        host: payload[:host],
        rails_env: Rails.env,

        process_id: Process.pid,
        request_id: payload[:headers]['action_dispatch.request_id'],
        request_time: Time.zone.now.utc,

        remote_ip: payload[:remote_ip],
        ip: payload[:ip],

        x_forwarded_for: payload[:x_forwarded_for],
        x_request_id: payload[:x_request_id],

        params: payload[:params].except(*LOGRAGE_EXCEPTIONS).to_json,

        exception: payload[:exception]&.first,
        exception_message: payload[:exception]&.last.to_s,
        exception_backtrace: payload[:exception_object]&.backtrace&.join(',')
      }.compact
    end
end
