require 'settingslogic'
class AppConfig < Settingslogic
  source File.dirname(__FILE__) << "/app_config.yml"

  # For computing the a string for host settings. There can be multiple host settings such as asset host.
  # @params [String, Symbol] server name of host
  # @params [Hash] params segment key-values to override default. A false value can hide that segment.
  # @option params [String, false] :protocol
  # @option params [String, false] :subdomain
  # @option params [String, false] :domain
  # @option params [Integer, false] :port
  # @returns [String] host domain
  def self.host(server = :default, params = {})
    default_params = self.get("hosts.#{server}").to_hash
    params = default_params.merge(params)

    url = ''
    url << params[:protocol].clone << '://' if params[:protocol]
    url << params[:subdomain].clone << '.' if params[:subdomain]
    url << params[:domain]
    url << ':' << params[:port].to_s if params[:port]
    url
  end
end
