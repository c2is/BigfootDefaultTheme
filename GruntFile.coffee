module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-coffee'

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    concat:
      js:
        src: [
          'Resources/assets/js/jquery-ui-1.10.4.min.js'
          'Resources/assets/js/jquery.form.js'
          'Resources/assets/js/jquery.portfolio.js'
          'Resources/assets/js/nestable.js'
          'Resources/assets/js/chosen.jquery.min.js'
          'Resources/assets/js/bootstrap.min.js'
          'Resources/assets/js/bootstrap-modalmanager.js'
          'Resources/assets/js/bootstrap-modal.js'
          'Resources/assets/js/modal.js'
          'Resources/assets/js/custom.js'
          'Resources/public/vendor/ckeditor/ckeditor.js'
          'Resources/assets/coffee/*.js'
        ]
        dest: 'Resources/public/js/scripts.js'
      css:
        src: [
          'Resources/assets/css/bootstrap.min.css'
          'Resources/assets/css/chosen.min.css'
          'Resources/assets/css/jquery-ui-1.10.4.min.css'
          'Resources/assets/css/font-awesome.min.css'
          'Resources/assets/css/bootstrap-modal-bs3patch.css'
          'Resources/assets/css/bootstrap-modal.css'
          'Resources/assets/css/custom.css'
        ]
        dest: 'Resources/public/css/styles.css'
    cssmin:
      main:
        files:
          'Resources/public/css/styles.min.css': ['Resources/public/css/styles.css']
    uglify:
      main:
        options:
          compress:
            drop_console: true
        files:
          'Resources/public/js/scripts.min.js': 'Resources/public/js/scripts.js'
    coffee:
      front:
        expand: true
        flatten: true
        src: ['Resources/assets/coffee/*.coffee']
        dest: 'Resources/assets/js/coffee/'
        ext: '.js'

  grunt.registerTask('default', ['coffee', 'concat', 'javascript', 'css'])
  grunt.registerTask('javascript', ['uglify'])
  grunt.registerTask('css', ['cssmin'])