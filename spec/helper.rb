require 'bacon'
require 'bacon/colored_output'
require_relative 'support/bacon'

if ENV['COVERAGE']
  require_relative 'support/simplecov'
end

require_relative '../lib/ruby-lint'
require_relative 'support/building'
require_relative 'support/parsing'
require_relative 'support/definitions'

Bacon.summary_on_exit
