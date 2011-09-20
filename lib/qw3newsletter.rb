require "qw3newsletter/version"

module Qw3newsletter
  class Qw3newsletter < Rails::Engine
    config.autoload_paths << File.expand_path("../app", __FILE__)
  end
end
