(() ->
  # Make it safe to do console.log() always.
  console = window.console = window.console or {}
  method = undefined
  dummy = ->
  methods = ('assert,count,debug,dir,dirxml,error,exception,
         group,groupCollapsed,groupEnd,info,log,markTimeline,
         profile,profileEnd,time,timeEnd,trace,warn').split ','

  console[method] = console[method] or dummy while method = methods.pop()

  # Help backbone links
  $(document).on "click", "a[href^='/']", (event) ->
    href = $(event.currentTarget).attr('href')
    # chain 'or's for other black list routes
    passThrough = href.indexOf('sign_out') >= 0

    # Allow shift+click for new tabs, etc.
    if !passThrough && !event.altKey && !event.ctrlKey && !event.metaKey && !event.shiftKey
      event.preventDefault()

      # Remove leading slashes and hash bangs (backward compatablility)
      url = href.replace(/^\//,'').replace('\#\!\/','')

      # Instruct Backbone to trigger routing events
      app.trigger "navigate", url

      return false
)()
