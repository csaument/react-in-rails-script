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
# Option: add reactstrap for rendering
yarn add reactstrap
mkdir ./app/javascript/components/assets
mkdir ./app/javascript/components/components
mkdir ./app/javascript/components/pages
mkdir ./app/javascript/components/tests
touch ./app/javascript/components/pages/Home.js
touch ./app/javascript/components/pages/IndexWorkout.js
touch ./app/javascript/components/pages/IndexConnections.js
touch ./app/javascript/components/pages/CreateWorkout.js
touch ./app/javascript/components/pages/CreateConnection.js
touch ./app/javascript/components/pages/EditWorkout.js
touch ./app/javascript/components/pages/EditConnection.js
touch ./app/javascript/components/pages/CreateChallenge.js
touch ./app/javascript/components/pages/ShowWorkout.js
touch ./app/javascript/components/pages/ShowConnection.js
touch ./app/javascript/components/pages/About.js
touch ./app/javascript/components/pages/NotFound.js
touch ./app/javascript/components/components/Header.js
touch ./app/javascript/components/components/Footer.js
touch ./app/javascript/components/tests/Home.test.test.js
touch ./app/javascript/components/tests/IndexWorkout.test.js
touch ./app/javascript/components/tests/IndexConnections.test.js
touch ./app/javascript/components/tests/CreateWorkout.test.js
touch ./app/javascript/components/tests/CreateConnection.test.js
touch ./app/javascript/components/tests/EditWorkout.test.js
touch ./app/javascript/components/tests/EditConnection.test.js
touch ./app/javascript/components/tests/CreateChallenge.test.js
touch ./app/javascript/components/tests/ShowWorkout.test.js
touch ./app/javascript/components/tests/ShowConnection.test.js
touch ./app/javascript/components/tests/About.test.js
touch ./app/javascript/components/tests/NotFound.test.js
touch ./app/javascript/components/tests/Header.test.js
touch ./app/javascript/components/tests/Footer.test.js
yarn add react-router-dom
# Option: add jest for testing
yarn add jest
# Option: generate models for backend
rails g migration add_permission_level_to_users permission_level:integer
rails g migration add_username_to_users username:string
rails g migration add_photo_to_users photo:string
rails g resource Connection type:string followed_id:integer follower_id:integer
rails g resource Workout name:string type:string user_id:integer duration:time schedule:timestamp description:text created_at:timestamp updated_at:timestamp
rails g resource Challenge challenged_id:integer challenger_id:integer
rails g resource Exercise name:string sets:integer repetitions:integer weight:float units:string intensity:float workout_id:integer
rails g resource Comment title:string comment:text sent_at:datetime workout_id:integer sender_id:integer recipient_id:integer
# Add GitHub connection
read -p "What is the GitHub link?" github_link
git remote add origin $github_link
git branch -M main
git add .
git commit -m 'initial commit'
git push -u origin main
code .