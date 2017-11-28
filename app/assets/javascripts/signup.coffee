# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


window.eventHandlers = ->
  socialid.events.onLoginSuccess.addHandler (data) ->
    $.ajax
      url: '/signup/login.json'
      type: 'POST'
      data:
        'token': data.token
      success: (data) ->
        if data.location
          console.log "oi"
          window.location.href = data.location
      error: (data) ->
        console.log 'Error!', data
        false
    console.log 'Website received onLoginSuccess: ', data

  socialid.events.onLoginCancel.addHandler (data) ->
    console.log 'Website received onLoginCancel: ', data
    return
  socialid.events.onLoginError.addHandler (data) ->
    console.log 'Website received onLoginError: ', data
    return
  socialid.events.onLoginStart.addHandler (data) ->
    console.log 'Website received onLoginStart: ', data
    return
  return