module.exports = (grunt) ->
  grunt.initConfig
    haml:
      dist:
        expand: true
        flatten: false
        cwd: 'src'
        src: ['**/*.haml']
        dest: 'build'
        ext: '.html'

    copy:
      main:
        expand: true
        cwd: 'src'
        src: ['*/*']
        dest: 'build'

    watch:
      haml:
        files: ["src/**/index.haml"]
        tasks: ["compile:haml"]
      static:
        files: ['src/*/*']
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
