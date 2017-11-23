#!/usr/bin/ruby

# https://query1.finance.yahoo.com/v7/finance/quote?symbols=

require 'rest-client'
require 'json'

url = "https://query1.finance.yahoo.com/v7/finance/quote?symbols="
prices = Hash.new(0)

fin = File.open("./epic", "r")
fin.each_line do |line|
 #response = RestClient.get("#{url}",{accept: :json},params: {symbols: #{line}})
 #response = RestClient.get(#{url},params: {symbols: #{line}})
 response = RestClient.get("#{url}#{line}",{accept: :json})
 #puts response.code	
 parsed = JSON.parse(response.body)
 prices[":#{line.chomp}"] =  parsed["quoteResponse"]["result"].first["regularMarketPrice"]
end
fin.close

File.open("./epic.out", "w") do |f|
 prices.each do |k, v|
  f.write("#{k.to_s.sub(/:/,'')}:#{v}\n")
 end
end

# The following line is for Vim users - please don't delete it.
# vim: set filetype=ruby expandtab tabstop=2 shiftwidth=2:
