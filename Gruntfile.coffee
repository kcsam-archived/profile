module.exports = (grunt) ->
  grunt.initConfig
    haml:
      dist:
        files:
          'build/index.html': 'src/index.haml'

    copy:
      main:
        expand: true
        cwd: ''
        src: ['./css/*', './fonts/*', './js/*']
        dest: '../'

    watch:
      haml:
        files: ["./index.haml"]
        tasks: ["compile:haml"]
      static:
        files: ['./res/*', './css/*', './img/*']
        tasks: ["compile:copy"]

    connect:
      server:
        options:
          port: 8000
          base: 'build'

  #Load Tasks
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-haml2html'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-connect'

  grunt.registerTask 'compile', ['haml', 'copy']
  grunt.registerTask 'server', ['connect:server', 'watch']
