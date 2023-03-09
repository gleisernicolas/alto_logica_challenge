require_relative '../lib/line_item'
require_relative '../lib/basquet'
require_relative '../lib/line_item_parser'

def run(file_name)
  basquet = Basquet.new

  line_items = File.readlines(file_name).map do |line|
    basquet.add_item(LineItemParser.parse(line))
  end

  basquet.to_s
end

if $0 == __FILE__
  raise ArgumentError, "Usage #{$0} filename.txt" unless ARGV.length > 0
  file_name = ARGV.first

  
  puts run(file_name)
end