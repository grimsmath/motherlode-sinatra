class Logger
  # All of the logging commands to support
  CMDS = ['log', 'info', 'warn', 'error']

  # Override this with your own logic to determine if we
  # are running in debug mode. Return true if you want
  # debug messages to show in the console.
  isDev = -> true

  constructor: ->
    for name in CMDS
      # Generate the logging function
      @[name] = do (name) ->
        ->
          # If debugging is enabled and this browser has a console
          if isDev() and window.console?
            window.console[name].apply(console, arguments)

    # Alias debug() to log()
    @debug = @log