# react-in-rails-script
DRY - Don't repeat yourself.

The purpose of this script is to consolidate all of the console commands necessary for creating a Ruby in Rails application. The current version still requires a few manual updates to the content of files.

* Run the script file by calling the name. You'll receive prompts for file_name and file_location, which is asking for a relative directory from your present working directory.

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
config/routes.rb

* Replace file contents with:
```ruby
Rails.application.routes.draw do
  get '*path', to: 'home#index', constraints: ->(request){ request.format.html? }
  root 'home#index'
end
```

* Navigate to:
app/assets/stylesheets/application.scss

* Replace file contents with:
```scss
@import "bootstrap";
```

* Navigate to:
app/javascript/components/App.js

* Update export statement to:
```jsx

import { BrowserRouter, Routes, Route } from "react-router-dom"
import React from 'react'
import Navigation from "./components/Navigation"
import About from "./pages/About"
import Home from "./pages/Home"

const App = ({
  logged_in,
  current_user,
  new_user_route,
  sign_in_route,
  sign_out_route
  }) => {

    return (
      <BrowserRouter>
        <Navigation />
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/about" element={<About />} />
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
import React from "react"
import { Nav, NavItem } from "reactstrap"

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
          <a href={sign_out_route} className="nav-link">
            Sign Out
          </a>
        </NavItem>
      ) : return (
        <NavItem>
          <a href={sign_in_route} className="nav-link">
            Sign In
          </a>
        </NavItem>
      )}

    </Nav>
  )
}

export default Header
```

* Navigate to:
config/environments/development.rb

* Add:
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

* Navigate to:
config/initializers/devise.rb

* Replace:
config.sign_out_via = :delete

* With:
config.sign_out_via = :get