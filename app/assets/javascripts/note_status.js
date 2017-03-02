var API = "http://localhost:3000"

$(document).ready(function() {
  $('button.update_note').on('click', function() {
    var note = $.parseJSON($('button.update_note').val());
    var noteId = note.note.id;
    return $.ajax({
      url: API + '/notes/' + noteId,
      method: 'PUT',
      data: note 
    }).done(function() { console.log('note updated') }).fail(console.log('Error'));
  });
});
