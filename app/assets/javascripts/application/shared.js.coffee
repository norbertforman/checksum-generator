window.checksumgenerator = window.checksumgenerator or {}
((shared, $) ->

  shared.init_flash = (message) ->
    if message.length == 0
      $("#flash").hide()
    else
      $("#flash").fadeIn("slow")
      setTimeout (->
        $("#flash").fadeOut("slow")
        return
      ), 4000

) window.checksumgenerator.shared = window.checksumgenerator.shared or {}, jQuery
