;(function () {
  'use strict'

  angular.module('frontendReloadControl', []).factory('FrontendReloadControlInterceptor', FrontendReloadControlInterceptor)

  FrontendReloadControlInterceptor.$inject = ['$cookies']

  function FrontendReloadControlInterceptor ($cookies) {
    var service = {
      'response': response
    }

    return service

    function response (res) {
      var newTimestamp = res.headers('X-Frontend-Reload-Control-Timestamp')

      if (newTimestamp) {
        var currentTimestamp = $cookies.get('X-Frontend-Reload-Control-Timestamp')
        if (!currentTimestamp) {
          console.log("Set New X-Frontend-Reload-Control-Timestamp: " + newTimestamp)
          $cookies.put('X-Frontend-Reload-Control-Timestamp', newTimestamp)
        } else if (parseInt(newTimestamp) > parseInt(currentTimestamp)) {
          console.log("Set New X-Frontend-Reload-Control-Timestamp: " + newTimestamp)
          $cookies.put('X-Frontend-Reload-Control-Timestamp', newTimestamp)
          location.reload()
        }
      }
      return res
    }
  }
})()

