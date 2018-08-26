require 'json'

module Helpers
  def json_fixture_data_for file_name
    current_dir = File.dirname __FILE__
    json_file = File.join(current_dir, '../', "spec/fixtures/#{file_name}")
    JSON.parse File.read json_file
  end
end
