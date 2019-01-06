# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
todo_label        = 'Todo'.freeze
in_progress_label = 'In Progress'.freeze
done_label        = 'Done'.freeze
blocked_label     = 'Blocked'.freeze
canceled_label    = 'Cancel'.freeze

Status.create([
 {name: todo_label,        description: ''},
 {name: in_progress_label, description: ''},
 {name: done_label,        description: ''},
 {name: blocked_label,     description: ''},
 {name: canceled_label,    description: ''}
])

todo        = Status.find_by_name(todo_label)
in_progress = Status.find_by_name(in_progress_label)
done        = Status.find_by_name(done_label)
blocked     = Status.find_by_name(blocked_label)
canceled    = Status.find_by_name(canceled_label)

transitions = Transition.create([
  {start: todo, end: in_progress},
  {start: todo, end: canceled},
  {start: todo, end: done},
  {start: todo, end: blocked},
  {start: in_progress, end: todo},
  {start: in_progress, end: done},
  {start: in_progress, end: blocked},
  {start: in_progress, end: canceled},
  {start: done, end: todo},
  {start: done, end: in_progress},
  {start: done, end: canceled},
  {start: done, end: blocked},
  {start: blocked, end: todo},
  {start: blocked, end: in_progress},
  {start: blocked, end: canceled},
  {start: blocked, end: done},
  {start: canceled, end: todo},
  {start: canceled, end: in_progress},
  {start: canceled, end: blocked},
  {start: canceled, end: done}
])

workflow = Workflow.create(name: 'Productivity Workflow')

workflow.transitions << transitions
