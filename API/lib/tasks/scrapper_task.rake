desc 'scrappping la lupa'
task scrapping_la_lupa: :environment do
  puts "Starting scrapper"
  include ScrappingLaLupa
  get_proposals
  puts "End scrapper"
end
