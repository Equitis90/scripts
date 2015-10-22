#!/usr/bin/env ruby

require 'net/http'

page_address = ARGV[0].gsub('http://', '').chomp('/')

source = Net::HTTP.get(page_address, '/')

links = {}

source.each_line do |line|
  matches = line.downcase.scan(/<a href="([^"]*)"/)
  matches.each do |mtch|
    link = mtch[0]
    if link.start_with?('//')
      link = link.gsub('//', 'http://')
    end
    unless link.start_with?('http') || link.start_with?('https')
      if link[0] == '/'
        link = "http://#{page_address}#{link}"
      else
        link = "http://#{page_address}/#{link}"
      end
    end
    links[link] = true
  end
end

links.each do |k, v|
  puts k
end