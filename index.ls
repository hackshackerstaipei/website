<- $(document).ready
$('[data-toggle="tooltip"]').tooltip!

fbref = new Firebase \https://hackshackers-taipei.firebaseio.com/subscriptions
$('#subscribe .btn').on \click, ->
  if $('#subscribe').hasClass \ok => return
  email = $('#subscribe input').val!
  $('#subscribe i.fa.check').css \opacity, 0
  $('#subscribe .loader').css \opacity, 0
  ret = /^[-a-z0-9~!$%^&*_=+}{\'?]+(\.[-a-z0-9~!$%^&*_=+}{\'?]+)*@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.[a-z]{2,}|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/i.exec(email)
  if !ret =>
    $('#subscribe').addClass \has-error
    return
  $('#subscribe').removeClass \has-error
  $('#subscribe .loader').css \opacity, 1
  fbref.push { email: $('#subscribe input').val!}, (e)->
    if e => alert 'failed to subscribe, please try later'
    else
      $('#subscribe .loader').css \opacity 0
      $('#subscribe').addClass \ok
      $('#subscribe .btn').addClass \disabled
