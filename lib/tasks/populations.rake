require 'rubygems'
require 'open-uri'
require 'pry'

task :populations => :environment do
  doc = Nokogiri::HTML(open("http://en.wikipedia.org/wiki/List_of_countries_by_population"))
  rows = doc.xpath('//*[@id="mw-content-text"]/table[2]/tr')
  rows.shift
  all_countries = rows.map do |row|
    {
      country: row.xpath('td[2]/a').children.first.text,
      population: row.xpath('td[3]').children.first.text.gsub(',','').to_i,
    }
  end
  mapped = all_countries.map do |country|
    Medal.select { |medal| medal.country.include?(country[:country]) }.try(:first)
  end
  binding.pry
end

