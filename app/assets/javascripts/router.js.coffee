# For more information see: http://emberjs.com/guides/routing/

Notes.Router.map ()->
  @resource('notes', {path: '/'}, ()->
    @route('note', {path: '/:note_id'})
    return
  )
  return

Notes.Router.reopen
  location: 'history'