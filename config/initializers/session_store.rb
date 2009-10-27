# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_iDeeli_session',
  :secret      => '55b66a488509f01d6cacd6c054a2ded9ef21471d7c90a45b2278fd1b171f20537e7a5d79797e6b657f9ca09756c78caa14d4642d834c1b923668d642da044e0a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
