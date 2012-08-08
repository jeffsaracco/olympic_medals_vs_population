require 'rubygems'
require 'open-uri'
require 'pry'

task :refresh => :environment do
  Medal.destroy_all
  doc = Nokogiri::HTML(open("http://www.london2012.com/medals/medal-count/"))
  # table = doc.xpath('//*[@id="overall_medals"]/table/tbody')
  rows = doc.xpath('//*[@id="overall_medals"]/table/tbody/tr')
  all_medals = rows.map do |row|
    Medal.create!(
    country: row.xpath('td[2]/div/div/a/span').children.first.text,
    gold: row.xpath('td[@class="gold c"]').children.first.text.to_i,
    silver: row.xpath('td[@class="silver c"]').children.first.text.to_i,
    bronze: row.xpath('td[@class="bronze c"]').children.first.text.to_i,
    total: row.xpath('td[@class="total c"]').children.first.text.to_i
    )
  end
  binding.pry
end

