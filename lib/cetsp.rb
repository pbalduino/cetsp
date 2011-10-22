# encoding UTF-8

require 'nokogiri'
require 'open-uri'

module CetSp
  class Parser

    def initialize(source)
      puts source
      @parser = Nokogiri::HTML(open(source), nil, 'ASCII-8BIT')
      @events = []
    end

    def parse
      rows = @parser.search('tr.cor1', 'tr.cor2')
      rows.each do |row|
        @events << Event.new(:code =>      row.children[0].to_str.force_encoding("ASCII-8BIT").gsub(/\302\240/, ' ').strip.to_i,
                             :place =>     row.children[2].to_str.force_encoding("ASCII-8BIT").gsub(/\302\240/, ' ').strip,
                             :direction => row.children[4].to_str.force_encoding("ASCII-8BIT").gsub(/\302\240/, ' ').strip)
      end
      @events
    end
  end

  class Event
    attr_reader :code, :place, :direction, :since

    def initialize(options)
      @code = options[:code]
      @place = options[:place]
      @direction = options[:direction]
    end
  end
end

