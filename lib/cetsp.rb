# encoding UTF-8

require 'nokogiri'

module CetSp
  class Parser

    def initialize(source)
      @parser = Nokogiri::HTML(open(source), nil, 'UTF-8')
      @events = []
    end

    def parse
      rows = @parser.xpath('//body/center/table[2]/tr')
      rows.each do |row|
        begin
          @events << Event.new(:code => row.children[0].to_str.gsub(/\302\240/, ' ').strip.to_i,
                               :place => row.children[2].to_str.gsub(/\302\240/, ' ').strip,
                               :direction => row.children[4].to_str.gsub(/\302\240/, ' ').strip,
                               :since => DateTime.strptime(row.children[6].to_str.gsub(/\302\240/, ' ').strip, "%d/%m/%y-%H:%M"))
        rescue
        end
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
      @since = options[:since]
    end
  end
end

