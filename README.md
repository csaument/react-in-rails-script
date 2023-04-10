# ruby-in-rails-script
DRY - Don't repeat yourself.

The purpose of this script is to consolidate all of the console commands necessary for creating a Ruby in Rails application. The current version still requires a few manual updates to the content of files.

* Navigate to:
app/views/home/index.html.erb

* Replace file contents with:
```erb
<%= react_component 'App' %>
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

return (
  <BrowserRouter>
    <Navigation />
    <Routes>
      <Route path="/" element={<Home />} />
      <Route path="/about" element={<About />} />
    </Routes>
  </BrowserRouter>
)

export default App
```

* Havigate to:
app/javascript/components/components/Navigation.js

* Replace file contents with:
```jsx
import React from "react"
import { Nav, NavItem } from "reactstrap"
import { NavLink } from "react-router-dom"

const Navigation = () => {
  return (
    <Nav>
      <NavItem>
        <NavLink to="/" className="nav-link">
          Home
        </NavLink>
      </NavItem>
      <NavItem>
        <NavLink to="/about" className="nav-link">
          About
        </NavLink>
      </NavItem>
    </Nav>
  )
}

export default Navigation
```
