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
yarn add ag-grid-community
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
mkdir ./app/javascript/components/tests
touch ./app/javascript/components/pages/Home.js
touch ./app/javascript/components/pages/About.js
touch ./app/javascript/components/pages/EventIndex.js
touch ./app/javascript/components/pages/EventShow.js
touch ./app/javascript/components/pages/EventCreate.js
touch ./app/javascript/components/pages/EventEdit.js
touch ./app/javascript/components/pages/MarineIndex.js
touch ./app/javascript/components/pages/NAVMCIndex.js
touch ./app/javascript/components/pages/NAVMCShow.js
touch ./app/javascript/components/pages/NAVMCCreate.js
touch ./app/javascript/components/pages/NAVMCEdit.js
touch ./app/javascript/components/pages/LogBook.js
touch ./app/javascript/components/pages/Dashboard.js
touch ./app/javascript/components/pages/NotFound.js
touch ./app/javascript/components/components/Header.js
touch ./app/javascript/components/components/Footer.js
touch ./app/javascript/components/pages/Home.js
touch ./app/javascript/components/pages/About.js
touch ./app/javascript/components/tests/EventIndex.test.js
touch ./app/javascript/components/tests/EventShow.test.js
touch ./app/javascript/components/tests/EventCreate.test.js
touch ./app/javascript/components/tests/EventEdit.test.js
touch ./app/javascript/components/tests/MarineIndex.test.js
touch ./app/javascript/components/tests/NAVMCIndex.test.js
touch ./app/javascript/components/tests/NAVMCShow.test.js
touch ./app/javascript/components/tests/NAVMCCreate.test.js
touch ./app/javascript/components/tests/NAVMCEdit.test.js
touch ./app/javascript/components/tests/LogBook.test.js
touch ./app/javascript/components/tests/Dashboard.test.js
touch ./app/javascript/components/tests/NotFound.test.js
touch ./app/javascript/components/tests/Header.test.js
touch ./app/javascript/components/tests/Footer.test.js
# touch ./spec/models/marine_spec.rb
# touch ./spec/models/event_spec.rb
# touch ./spec/models/navmc_spec.rb
# touch ./spec/requests/marine_spec.rb
# touch ./spec/requests/event_spec.rb
# touch ./spec/requests/navmc_spec.rb
yarn add react-router-dom
# Option: add jest for testing
yarn add jest
code .