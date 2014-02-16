# For more information see: http://emberjs.com/guides/routing/

Notes.NotesRoute = Ember.Route.extend
  model: ()->
    @store.find('note')
  

Notes.NotesNoteRoute = Ember.Route.extend
  model: (note)->
    @store.find('note', note.note_id.replace(/(-)/g, ' '))
  ,
  beforeModel: (transition)->
    notesController = this.controllerFor('notes')
    if(notesController.noteForDeletion)
      transition.abort()
    return