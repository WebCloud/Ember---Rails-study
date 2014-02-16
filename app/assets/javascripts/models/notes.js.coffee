# for more details see: http://emberjs.com/guides/models/defining-models/

Notes.Note = DS.Model.extend
  name: DS.attr('string'),
  value: DS.attr('string'),
  slug: (()->
    @get('name').dasherize()
  ).property('name')

# for using with some backend
# Notes.Note.reopen
#   url: '/some/url'

