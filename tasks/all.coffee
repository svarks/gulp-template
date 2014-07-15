gulp    = require 'gulp'
connect = require 'gulp-connect'

require './build.coffee'

gulp.task 'connect', ->
  connect.server(
    root: 'compiled'
    livereload: true
  )

gulp.task 'watch', ->
  gulp.watch 'assets/templates/*.jade', ['build:templates']
  gulp.watch 'assets/styles/**/*.styl', ['build:styles']
  gulp.watch 'assets/scripts/**/*.coffee', ['build:scripts']

  gulp.watch ['compiled/**/*.{html,js,css}'], (event) ->
    gulp.src(event.path).pipe(connect.reload())

gulp.task 'default', ['build', 'watch', 'connect']
