module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"

    source:
      coffee:
        app:
          [ 'app/coffee/*.coffee' ]

      stylesheets: 'app/stylesheets/'

    coffee:
      compile:
        files:
          'app/js/app.debug.js': ['<%= source.coffee.app %>']

#    uglify:
#      options: compress: false, banner: "<%= meta.banner %>"
#      coffee:
#        files:
#          #'<%= meta.endpoint %>js/index.js': '<%= meta.endpoint %>js/index.debug.js'
#          '<%= meta.endpoint %>server.js': '<%= meta.endpoint %>js/server.debug.js'

    compass:
      dist:
        options:
          sassDir: "<%= source.stylesheets %>"
          cssDir: 'app/css'

    cssmin:
      minify:
        expand: true,
        cwd: 'css/'
        src: ['*.css', '!*.min.css']
        dest: 'css/'
        ext: '.min.css'

    watch:
      coffee:
        files: ["<%= source.coffee.app %>"]
        tasks: ["coffee"]
      stylesheets:
        files: ["<%= source.stylesheets %>*.scss"]
        tasks: ["compass"]
  #jade:
  # files: ["<%= source.jade %>*.jade"]
  #tasks: ["jade"]


  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-compass"
  #grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-cssmin"


  grunt.registerTask "default", [ "compass", "cssmin", "coffee"] #,"coffe","concat","uglify"]

###
  concat:
    css:
      src: ['<%= source.css_core %>'],
      dest: '<%= meta.endpoint %>static/stylesheets/watch.css'
###
