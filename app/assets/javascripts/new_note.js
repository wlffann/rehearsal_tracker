var API = "http://rehearsaltracker.herokuapp.com/" 

$(document).ready(function() { 
  $('button#note').on('click', function() { 
    $('.modal').css({'display': 'block'}); 
  });

  $('input[type=submit]').on('click', function() {
    $('.modal').css({'display': 'none'})
    createNote();
  });

  var createNote = function() {
    var rehearsalId = $('input[name=note_rehearsal]').val();
    var noteContent = $('.modal textarea').val();
    var noteTeam = $('select').val(); 
    return $.ajax({
      url: API + '/api/v1/rehearsals/' + rehearsalId + '/notes',
      method: 'POST',
      data: { 'note': {'content': noteContent, 'team_id': noteTeam, 'status': 'inactive'} }
    }).done( function(response) {
      $('.notes').append("<div class='note'><p>" + response.content + "</p><div class='status" + repsonse.status + "'>" + repsonse.status + "</div></div>");
    } ).fail(function() {console.log('fail')} );
  };
})
