# for more details see: http://emberjs.com/guides/controllers/

Notes.NotesNoteController = Ember.ObjectController.extend
  actions:
    updateNote: ()->
      content = @get('content')
      if content
        content.save()