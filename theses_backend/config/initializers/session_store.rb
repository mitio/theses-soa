# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_theses_session',
  :secret      => 'b24c9cd0080266ddf7bc12e2f7358cd03716b44a0bd902a64d84b43445ee046aa62253f4ffe7652b03c694d8704ba05387dcdf1baa7e4cb30200f20048eba135'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
