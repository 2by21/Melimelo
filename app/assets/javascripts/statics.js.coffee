window.App ||= {}
class App.Static extends App.Base

    home: =>
        $ ->

            ##################
            # Tabs Javascript#
            ##################

            extend = (a, b) ->
              for key of b
                a[key] = b[key]  if b.hasOwnProperty(key)
              a

            CBPFWTabs = (el, options) ->
              @el = el
              @options = extend({}, @options)
              extend @options, options
              @_init()
              return

            CBPFWTabs::options = start: 0

            CBPFWTabs::_init = ->
              
              # tabs elems
              @tabs = [].slice.call(@el.querySelectorAll("div > nav > ul > li"))
              
              # content items
              @items = [].slice.call(@el.querySelectorAll(".content-wrap > section"))
              
              # current index
              @current = -1
              
              # show current content item
              @_show()
              
              # init events
              @_initEvents()
              return

            CBPFWTabs::_initEvents = ->
              self = this
              @tabs.forEach (tab, idx) ->
                tab.addEventListener "click", (ev) ->
                  ev.preventDefault()
                  self._show idx
                  return

                return

              return

            CBPFWTabs::_show = (idx) ->
              @tabs[@current].className = @items[@current].className = ""  if @current >= 0
              
              # change current
              @current = (if idx isnt `undefined` then idx else (if @options.start >= 0 and @options.start < @items.length then @options.start else 0))
              @tabs[@current].className = "tab-current"
              @items[@current].className = "content-current"
              return
            
            window.CBPFWTabs = new CBPFWTabs(document)

            
            ######################
            # Javascript Gallery #
            ######################

            $('.tabs nav ul li:first').addClass('tab-button')

            prototypingCount = 0
            productionCount = 0

            options = {
              infiniteLoop: true,
              captions: true,
              adaptiveHeight: false,
              responsive: true,
              touchEnabled: true,
              preventDefaultSwipeX: true,
              controls: true,
              startSlide: 0,
              auto: true,
              preloadImages: 'visible'
            }

            slider1 = $('.slider1')
            slider2 = $('.slider2')
            slider3 = $('.slider3')

            slider1.bxSlider(options)
            slider2.bxSlider(options)
            slider3.bxSlider(options)

            $('.tab-button').click ->
              slider1.reloadSlider(options)
              slider2.reloadSlider(options)
              slider3.reloadSlider(options)

            
 
            