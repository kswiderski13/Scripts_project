#libraries
require 'nokogiri'
require 'httparty'

#website url
link = 'https://www.ceneo.pl/Smartfony;szukaj-telefon'
#allegro doesn't work with this code

response = HTTParty.get(link, headers: {
  "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"
})

parsed = Nokogiri::HTML(response.body) #converting to css I believe

products = parsed.css('div.cat-prod-row')

products.each_with_index do |product, index|
title = product.at_css('strong.cat-prod-row__name span')&.text&.strip
price = product.at_css('span.price')&.text&.strip
#decimals = product.at_css('span.penny')&.text&.strip
puts "Produkt: #{index + 1}:"
puts "Tytuł: #{title}"
puts "Cena: #{price}"
end