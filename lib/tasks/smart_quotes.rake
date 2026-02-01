require_relative "smart_quotes/linter"

namespace :smart_quotes do
  desc "Find smart quotes in source files - fails if any found (for CI)"
  task :find do
    exit SmartQuotes::Linter.new.find
  end

  desc "Find and replace smart quotes with straight quotes in source files"
  task :replace do
    SmartQuotes::Linter.new.replace
  end
end
