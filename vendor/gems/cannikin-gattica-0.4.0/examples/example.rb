require '../lib/gattica'

# authenticate with the API via email/password
ga = Gattica.new({:email => 'username@gmail.com', :password => 'password'})

# or, initialize via a pre-existing token. This initialization does not authenticate immediately, 
# but will throw an error on subsequent calls (like ga.accounts) if the token is invalid
# ga = Gattica.new({:token => 'DQAAAJYAAACN-JMelka5I0Fs-T6lF53eUSfUooeHgcKc1iEdc0wkDS3w8GaXY7LjuUB_4vmzDB94HpScrULiweW_xQsU8yyUgdInDIX7ZnHm8_o0knf6FWSR90IoAZGsphpqteOjZ3O0NlNt603GgG7ylvGWRSeHl1ybD38nysMsKJR-dj0LYgIyPMvtgXLrqr_20oTTEExYbrDSg5_q84PkoLHUcODZ' })

# get the list of accounts you have access to with that username and password
accounts = ga.accounts

# for this example we just use the first account's profile_id, but you'll probably want to look
# at this list and choose the profile_id of the account you want (the web_property_id is the
# property you're most used to seeing in GA, looks like UA123456-1)
ga.profile_id = accounts.first.profile_id

# If you're using Gattica with a web app you'll want to save the authorization token
# and use that on subsequent requests (Google recommends not re-authenticating each time)
# ga.token

# now get the number of page views by browser for Janurary 2009
data = ga.get({ :start_date => '2009-01-01', 
                :end_date => '2009-01-31',
                :dimensions => ['browser'],
                :metrics => ['pageviews'],
                :sort => ['-pageviews'] })
           
# output the data as CSV     
puts data.to_csv

# a little more complex example with filtering. Show all pageviews by Firefox browsers
# (any version) where the number of page views is greater than 100
data = ga.get({ :start_date => '2009-01-01', 
                :end_date => '2009-01-31',
                :dimensions => ['browser','browserVersion'],
                :metrics => ['pageviews'],
                :sort => ['-pageviews'],
                :filters => ['browser == Firefox', 'pageviews > 100'] })

# write the data out as CSV in "short" format (doesn't include id, updated or title parameters)
puts data.to_csv(:short)

data = ga.get({ :start_date => 1.week.ago.to_date.strftime('%Y-%m-%d'), 
                :end_date => 1.days.ago.to_date.strftime('%Y-%m-%d'),
                :dimensions => ['landingPagePath'],
                :metrics => ['entrances'],
                :sort => ['-landingPagePath'] })