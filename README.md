# Requirements
- angular
- angular-cookies (ngCookies)


# Rails setup for angular

Add gem
```
gem 'frontend_reload_control'
```

Add in application.js
```
//= require frontend_reload_control
```
Inject "frontendReloadControl" on your Angular module and
Add on your main modules
```
.config(function ($httpProvider) {
  $httpProvider.interceptors.push('FrontendReloadControlInterceptor')
})
```

# Cors (optional)

If your frontend and api has diferents domains you need to configure CORS to expose X-Frontend-Reload-Control-Timestamp header.
Need help? https://github.com/cyu/rack-cors

# Tips
This gem will looks for timestamp.txt file on root of project to setup the actual version of app, if it doesn't exists it will use Time.now.to_i at APP startup.

If you want to avoid browser to reload for each APP restarts you need to create timestamp.txt with current timestamp when you deploy/update your APP.
