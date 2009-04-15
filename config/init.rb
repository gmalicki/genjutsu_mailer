# Go to http://wiki.merbivore.com/pages/init-rb
 
# Specify a specific version of a dependency
# dependency "RedCloth", "> 3.0"

dependency "merb-mailer"

#  use_orm :none
use_test :rspec
use_template_engine :erb
 
Merb::Config.use do |c|
  c[:use_mutex] = false
  c[:session_store] = 'cookie'  # can also be 'memory', 'memcache', 'container', 'datamapper
  
  # cookie session store configuration
  c[:session_secret_key]  = '26c0b6933086b56b0aae64a225fb841e399dfea2'  # required for cookie session store
  c[:session_id_key] = '_genjutsu_mailer_session_id' # cookie session id key, defaults to "_session_id"
end
 
Merb::BootLoader.before_app_loads do
  # This will get executed after dependencies have been loaded but before your app's classes have loaded.
  Merb::Mailer.config = {:sendmail_path => '/somewhere/odd'}
  Merb::Mailer.delivery_method = :sendmail
end
 
Merb::BootLoader.after_app_loads do
  # This will get executed after your app's classes have been loaded.
end