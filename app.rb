# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
Bundler.require

# lignes qui appellent les fichiers lib/user.rb et lib/event.rb
# comme ça, tu peux faire User.new dans ce fichier d'application. Top.
require_relative 'lib/user'
require_relative 'lib/event'
require_relative 'lib/event_creator'
require_relative 'lib/calendar_displayer'


# Maintenant c'est open bar pour tester ton application. Tous les fichiers importants sont chargés
# Tu peux faire User.new, Event.new, binding.pry, User.all, etc.
Event.new("2021-01-24 07:00", 15, "RDV1", ['trac@machin.com','biadule@chose.fr'])
Event.new("2021-01-01 07:00", 10, "RDV0", ['tric@machin.com','bidezule@chose.fr'])
Event.new("2021-01-06 07:00", 13, "RDV2aaeazeaeazeaz", ['traac@machin.com','biedule@chose.fr'])
Event.new("2021-01-05 07:00", 05, "RDV3", ['trccc@machin.com','bidaule@chose.fr'])
binding.pry