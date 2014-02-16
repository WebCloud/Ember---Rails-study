# http://emberjs.com/guides/models/using-the-store/
Notes.ApplicationSerializer = DS.LSSerializer.extend()

Notes.ApplicationAdapter = DS.LSAdapter.extend
  namespace: 'notes-emberjs'