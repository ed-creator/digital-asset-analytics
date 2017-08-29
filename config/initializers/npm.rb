system 'npm install' if Rails.env.development? || Rails.env.test?


# Heroku: add Node.js support
# https://ricostacruz.com/til/npm-in-rails
# If you’re deploying to Heroku, the default Ruby buildpack doesn’t include Node, which you need to use npm. Add both the Node.js and Ruby buildpacks:
#
# heroku bulidpacks:add 'https://github.com/heroku/heroku-buildpack-nodejs.git'
# heroku bulidpacks:add 'https://github.com/heroku/heroku-buildpack-ruby.git'
