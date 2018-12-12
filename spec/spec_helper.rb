require "bundler/setup"
require "pdf4me"
require 'shoulda/matchers'

RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"

  config.disable_monkey_patching!
  config.expose_dsl_globally = true

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before :each do
    Typhoeus::Expectation.clear
  end

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :active_model
    end
  end

  config.include(Shoulda::Matchers::ActiveModel, type: :action)

end
