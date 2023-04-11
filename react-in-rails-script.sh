read -p "What is the application name?" app_name
read -p "What is the application directory?" app_dir
mkdir $app_dir
cd $app_dir
rails new $app_name -d postgresql -T
cd $app_name
rails db:create
bundle add webpacker
bundle add react-rails
rails webpacker:install
rails webpacker:install:react
yarn add @babel/preset-react
yarn add @rails/activestorage
yarn add @rails/ujs
rails g react:install
rails g react:component App
rails g controller Home index
bundle add devise
rails g devise:install
rails g devise User
rails db:migrate
bundle add bootstrap
mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss
# Option: add reactstrap for formatting
yarn add reactstrap
mkdir ./app/javascript/components/assets
mkdir ./app/javascript/components/components
mkdir ./app/javascript/components/pages
touch ./app/javascript/components/pages/Home.js
touch ./app/javascript/components/pages/About.js
touch ./app/javascript/components/components/Header.js
yarn add react-router-dom
# Option: add jest for testing
yarn add jest
code .