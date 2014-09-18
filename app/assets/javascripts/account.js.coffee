$(document).ready ->
  
  #Handles menu drop down
  $(".dropdown-menu").find("form").click (e) ->
    e.stopPropagation()
    return

  return
