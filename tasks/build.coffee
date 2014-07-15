gulp    = require 'gulp'
jade    = require 'gulp-jade'
stylus  = require 'gulp-stylus'
coffee  = require 'gulp-coffee'

gulp.task 'build:templates', ->
  gulp.src('assets/templates/*.jade')
    .pipe(jade(pretty: true))
    .pipe(gulp.dest('compiled'))

gulp.task 'build:styles', ->
  gulp.src('assets/styles/*.styl')
    .pipe(stylus(errors: true))
    .pipe(gulp.dest('compiled/styles'))

gulp.task 'build:scripts', ->
  gulp.src('assets/scripts/*.coffee')
    .pipe(coffee())
    .pipe(gulp.dest('compiled/scripts'))

gulp.task 'build', ['build:templates', 'build:styles', 'build:scripts']
