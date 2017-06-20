# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  if $('.pagination').length 
    $(window).scroll ->
      url = $(".pagination .next_page").attr('href')
      $('.loader').hide();
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
        $('.pagination').text("Loading more data.....")
        $.getScript(url)