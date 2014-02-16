# for more details see: http://emberjs.com/guides/controllers/

Notes.NotesController = Ember.ArrayController.extend
  needs: ['notesNote'],
  newNoteName: null,
  actions:
    createNewNote: ()->
      content = @get('content')
      newNoteName = @get('newNoteName')
      unique = newNoteName isnt null and newNoteName.length > 1

      content.forEach((note)->
        if newNoteName is note.get('name')
          unique = false
          return
      )

      if unique
        newNote = @store.createRecord('note')
        newNote.set('id', newNoteName)
        newNote.set('name', newNoteName)
        newNote.save()
        @set('newNoteName', null)
      else
        alert('Note must have a unique name of at least 2 characters!')
      return
    ,

    doDeleteNote: (note)->
      @set('noteForDeletion', note)
      $("#confirmDeleteNoteDialog").modal({"show": true})
      return false
    ,

    doCancelDelete: ()->
      @set('noteForDeletion', null)
      $("#confirmDeleteNoteDialog").modal('hide')
      return
    ,

    doConfirmDelete: ()->
      selectedNote = @get('noteForDeletion')
      @set('noteForDeletion', null)
      if selectedNote
        @store.deleteRecord(selectedNote)
        selectedNote.save()
        if @get('controllers.notesNote.model.id') is selectedNote.get('id')
          @transitionToRoute('notes')
      $("#confirmDeleteNoteDialog").modal('hide')
      return

