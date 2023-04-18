# react-in-rails-script
DRY - Don't repeat yourself.

The purpose of this script is to consolidate all of the console commands necessary for creating a Ruby in Rails application. The current version still requires a few manual updates to the content of files.

* Make the file accessible for bash functions by calling on the chmod function:
chmod u+x react-in-rails-script.sh

* Run the script file by calling the name. You'll receive prompts for file_name and file_location, which is asking for a relative directory from your present working directory.
sh react-in-rails-script.sh

* Navigate to:
app/views/home/index.html.erb

* Replace file contents with:
```erb
<%= react_component 'App', {
  logged_in: user_signed_in?,
  current_user: current_user,
  new_user_route: new_user_registration_path,
  sign_in_route: new_user_session_path,
  sign_out_route: destroy_user_session_path
} %>
```

* Navigate to:
app/views/layouts/application.html.erb

* Replace:
```erb
<%= javascript_importmap_tags %>
```

* With:
```erb
<%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>
```

* Navigate to:
config/routes.rb

* Replace file contents with:
```ruby
Rails.application.routes.draw do
  devise_for :users
  get '*path', to: 'home#index', constraints: ->(request){ request.format.html? }
  root 'home#index'
end
```

* Navigate to:
app/assets/stylesheets/application.scss

* Replace file contents with:
```scss
@import 'bootstrap';

:root {
  --base-color: #151318;
  --mid-color: #fffdfe;
  --accent-color-1: #9bffff;
  --accent-color-2: #fe9176;
  --accent-color-3: #ffb7e9;
  --footer-height: 2.5rem;
}

.header {
  position: fixed;
  top: 0;
  width: 100vw;
  display: flex;
  align-content: row;
  gap: 2em;
  background-color: var(--base-color);
  color: var(--mid-color)
  border: 2px solid var(--accent-color-3);
}

.page-container {
  position: relative;
  min-height: 100vh;
}

.content-wrap {
  padding-bottom: var(--footer-height);
}

.footer {
  position: absolute;
  bottom: 0;
  width: 100vw;
  height: var(--footer-height);
  display: flex;
  align-content: row;
  gap: 2em;
  background-color: var(--base-color);
}
```

* Navigate to:
app/javascript/components/App.js

* Update to:
```jsx
import { BrowserRouter, Routes, Route } from 'react-router-dom'
import React from 'react'
import Header from './components/Header'
import Footer from './components/Footer'
import About from './pages/About'
import Home from './pages/Home'
import IndexWorkouts from './pages/IndexWorkouts'
import IndexConnections from './pages/IndexConnections'
import CreateWorkout from './pages/CreateWorkout'
import CreateConnection from './pages/CreateConnection'
import EditWorkout from './pages/EditWorkout'
import EditConnection from './pages/EditConnection'
import CreateChallenge from './pages/CreateChallenge'
import ShowWorkout from './pages/ShowWorkout'
import ShowConnection from './pages/ShowConnection'

const App = ({
  logged_in,
  current_user,
  new_user_route,
  sign_in_route,
  sign_out_route
  }) => {

    return (
      <BrowserRouter>
        <Navigation {
          logged_in,
          current_user,
          new_user_route,
          sign_in_route,
          sign_out_route
          }/>
        <Routes>
          <Route path='/' element={<Home />} />
          <Route path='/about' element={<About />} />
          <Route path='/workouts' element={<IndexWorkouts />} />
          <Route path='/connections' element={<IndexConnections />} />
          <Route path='/workouts/new' element={<CreateWorkout />} />
          <Route path='/connections/new' element={<CreateConnection />} />
          <Route path='/workouts/:id' element={<ShowWorkout />} />
          <Route path='/connections/:id' element={<ShowConnection />} />
          <Route path='/workouts/:id/edit' element={<EditWorkout />} />
          <Route path='/connections/:id/edit' element={<EditConnection />} />
        </Routes>
      </BrowserRouter>
    )
}

export default App
```

* Havigate to:
app/javascript/components/components/Header.js

* Replace file contents with:
```jsx
import React from 'react'
import { Nav, NavItem } from 'reactstrap'

const Header = ({
  logged_in,
  current_user,
  new_user_route,
  sign_in_route,
  sign_out_route
}) => {
  return (
    <Nav>
      {logged_in ? return (
        <NavItem>
          <a href={sign_out_route} className='nav-link'>
            Sign Out
          </a>
        </NavItem>
      ) : return (
        <NavItem>
          <a href={sign_in_route} className='nav-link'>
            Sign In
          </a>
          <a href={new_user_route} className='nav-link'>
            Sign Up
          </a>
        </NavItem>
      )}

    </Nav>
  )
}

export default Header
```

* Navigate to (line 38):
config/environments/development.rb

* Add:
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

* Navigate to (line 269):
config/initializers/devise.rb

* Replace:
config.sign_out_via = :delete

* With:
config.sign_out_via = :get

* Add to package.json
```json
  'devDependencies': {
    'jest-environment-jsdom': '^29.5.0',
    'webpack-dev-server': '^3'
  },
  'scripts': {
    'test': 'jest --watch',
    'test-watch': 'jest --watch'
  },
  'jest': {
    'testEnvironment': 'jsdom',
    'roots': [
      'app/javascript/components'
    ]
  }
```