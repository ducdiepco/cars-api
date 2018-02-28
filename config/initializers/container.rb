require 'dry/system/container'

class App < Dry::System::Container
  configure do |config|
    config.name = :cars
    config.root = ::Rails.root
    config.auto_register = %w[app/domains app/models]
  end

  load_paths!('lib', 'app', 'app/domains', 'app/models')
end

Import = App.injector
