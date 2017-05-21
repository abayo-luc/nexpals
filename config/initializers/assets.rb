# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w(ckeditor/config.js)
Rails.application.config.assets.precompile += %w( ckeditor/* )

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path
# String URL
Emoji.asset_host = 'http://mysite.com'

# Custom Host Proc, takes asset path as a param
Emoji.asset_host = lambda {|path| path.size % 2 == 0 ? 'http://even.com' : 'http://odd.com'}

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
