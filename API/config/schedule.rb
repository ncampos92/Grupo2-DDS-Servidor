set :output, 'tmp/scrapping_la_lupa.log'

every 2.minutes do
   rake "scrapping_la_lupa"
 end