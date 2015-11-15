set :output, 'tmp/scrapping_la_lupa.log'

every 24.hours do
   rake "scrapping_la_lupa"
 end