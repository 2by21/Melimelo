window.App ||= {}
class App.Static extends App.Base

    home: =>
        $ ->
            $('#prototyping-tab').hide()
            $('#production-tab').hide()
            $('.tabs').click ->
                $('.services-content').hide()
                $tabSelector = $(this).find('a').attr('class')
                $tabSelector = $tabSelector.substring(0, $tabSelector.length - 5)
                $('#' + $tabSelector).show()
                console.log '#' + $tabSelector