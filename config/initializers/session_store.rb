# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_TNA_DI_PATH_session',
  :secret      => '91ea3aa0969a397f34d55117746d9156787d868f96f347b997cf0b43a9d6e13eeb30a4aac41cb9ba698ba13b6718b6bf87235603114c09a04d76febbf8bd7507'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
