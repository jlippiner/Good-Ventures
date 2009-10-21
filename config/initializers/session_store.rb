# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_good_ventures_session',
  :secret      => '1d927332d42134990e4a6792b12218c3ce175068e888507b76671cb6befeed0192a7e8850424667c4b3d20b70692e91e2b89170b91f10e47208c1325721dd580'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
