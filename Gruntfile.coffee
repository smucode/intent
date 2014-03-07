# Generated on 2014-02-27 using generator-angular-fullstack 1.2.7
"use strict"

# # Globbing
# for performance reasons we're only matching one level down:
# 'test/spec/{,*/}*.js'
# use this if you want to recursively match all subfolders:
# 'test/spec/**/*.js'


module.exports = (grunt) ->
  require('./lib/util/silencer')(grunt)

  exec = require("child_process").exec
  spawn = require("child_process").spawn
  inquirer = require("inquirer")

  # Load grunt tasks automatically
  require("load-grunt-tasks") grunt

  # Time how long tasks take. Can help when optimizing build times
  require("time-grunt") grunt
  logExec = (err, stdout, stderr) ->
    grunt.log.writeln stdout
    grunt.log.error stderr  if stderr
    grunt.log.error err  if err isnt null
    return

  mongod = ->
    grunt.log.writeln "starting mongod"
    daemon = spawn("mongod", [],
      stdio: "ignore" #all output is to /usr/local/var/log/mongodb/mongo.log anyway
    )
    daemon.unref()
    return


  # Define the configuration for all the tasks
  grunt.initConfig

    # Project settings
    yeoman:

      # configurable paths
      app: require("./bower.json").appPath or "app"
      dist: "dist"

    express:
      options:
        port: process.env.PORT or 9000

      dev:
        options:
          script: "server.js"
          debug: true

      prod:
        options:
          script: "dist/server.js"
          node_env: "production"

    open:
      server:
        url: "http://localhost:<%= express.options.port %>"

    watch:
      js:
        options:
          spawn: false
        files: [
          "lib/**/*.js"
          "test/lib_spec/**/*.js"
        ]
        tasks: ["default"]

      coffee:
        files: ["<%= yeoman.app %>/scripts/{,*/}*.{coffee,litcoffee,coffee.md}"]
        tasks: ["newer:coffee:dist"]

      coffeeTest:
        files: ["test/app_spec/{,*/}*.{coffee,litcoffee,coffee.md}"]
        tasks: [
          "newer:coffee:test"
          "karma"
        ]

      compass:
        files: ["<%= yeoman.app %>/styles/{,*/}*.{scss,sass}"]
        tasks: [
          "compass:server"
          "autoprefixer"
        ]

      gruntfile:
        files: ["Gruntfile.js"]

      livereload:
        files: [
          "<%= yeoman.app %>/views/{,*//*}*.{html,jade}"
          "{.tmp,<%= yeoman.app %>}/styles/{,*//*}*.css"
          "{.tmp,<%= yeoman.app %>}/scripts/{,*//*}*.js"
          "<%= yeoman.app %>/images/{,*//*}*.{png,jpg,jpeg,gif,webp,svg}"
        ]
        options:
          livereload: true

      express:
        files: [
          "server.js"
          "lib/**/*.{js,json}"
        ]
        tasks: [
          "newer:jshint:server"
          "express:dev"
          "wait"
        ]
        options:
          livereload: true
          nospawn: true #Without this option specified express won't be reloaded

    # Make sure code styles are up to par and there are no obvious mistakes
    jshint:
      options:
        jshintrc: ".jshintrc"
        reporter: require("jshint-stylish")

      server:
        options:
          jshintrc: "lib/.jshintrc"

        src: ["lib/{,*/}*.js"]

      all: []

    # Empties folders to start fresh
    clean:
      dist:
        files: [
          dot: true
          src: [
            ".tmp"
            "<%= yeoman.dist %>/views/*"
            "<%= yeoman.dist %>/public/*"
            "!<%= yeoman.dist %>/public/.git*"
          ]
        ]

      heroku:
        files: [
          dot: true
          src: [
            "heroku/*"
            "!heroku/.git*"
            "!heroku/Procfile"
          ]
        ]

      server: ".tmp"
      bower: "app/bower_components"
      npm: "node_modules"

    # Add vendor prefixed styles
    autoprefixer:
      options:
        browsers: ["last 1 version"]

      dist:
        files: [
          expand: true
          cwd: ".tmp/styles/"
          src: "{,*/}*.css"
          dest: ".tmp/styles/"
        ]

    # Automatically inject Bower components into the app
    "bower-install":
      app:
        html: "<%= yeoman.app %>/views/index.html"
        ignorePath: "<%= yeoman.app %>/"
        exclude: ["bootstrap-sass"]

    # Compiles CoffeeScript to JavaScript
    coffee:
      options:
        sourceMap: true
        sourceRoot: ""

      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.app %>/scripts"
          src: "{,*/}*.coffee"
          dest: ".tmp/scripts"
          ext: ".js"
        ]

      test:
        files: [
          expand: true
          cwd: "test/app_spec"
          src: "{,*/}*.coffee"
          dest: ".tmp/app_spec"
          ext: ".js"
        ]

    # Compiles Sass to CSS and generates necessary files if requested
    compass:
      options:
        sassDir: "<%= yeoman.app %>/styles"
        cssDir: ".tmp/styles"
        generatedImagesDir: ".tmp/images/generated"
        imagesDir: "<%= yeoman.app %>/images"
        javascriptsDir: "<%= yeoman.app %>/scripts"
        fontsDir: "<%= yeoman.app %>/styles/fonts"
        importPath: "<%= yeoman.app %>/bower_components"
        httpImagesPath: "/images"
        httpGeneratedImagesPath: "/images/generated"
        httpFontsPath: "/styles/fonts"
        relativeAssets: false
        assetCacheBuster: false
        raw: "Sass::Script::Number.precision = 10\n"

      dist:
        options:
          generatedImagesDir: "<%= yeoman.dist %>/public/images/generated"

      server:
        options:
          debugInfo: true

    # Renames files for browser caching purposes
    rev:
      dist:
        files:
          src: [
            "<%= yeoman.dist %>/public/scripts/{,*/}*.js"
            "<%= yeoman.dist %>/public/styles/{,*/}*.css"
            "<%= yeoman.dist %>/public/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}"
            "<%= yeoman.dist %>/public/styles/fonts/*"
          ]

    # Reads HTML for usemin blocks to enable smart builds that automatically
    # concat, minify and revision files. Creates configurations in memory so
    # additional tasks can operate on them
    useminPrepare:
      html: [
        "<%= yeoman.app %>/views/index.html"
        "<%= yeoman.app %>/views/index.jade"
      ]
      options:
        dest: "<%= yeoman.dist %>/public"

    # Performs rewrites based on rev and the useminPrepare configuration
    usemin:
      html: [
        "<%= yeoman.dist %>/views/{,*/}*.html"
        "<%= yeoman.dist %>/views/{,*/}*.jade"
      ]
      css: ["<%= yeoman.dist %>/public/styles/{,*/}*.css"]
      options:
        assetsDirs: ["<%= yeoman.dist %>/public"]

    # The following *-min tasks produce minified files in the dist folder
    imagemin:
      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.app %>/images"
          src: "{,*/}*.{png,jpg,jpeg,gif}"
          dest: "<%= yeoman.dist %>/public/images"
        ]

    svgmin:
      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.app %>/images"
          src: "{,*/}*.svg"
          dest: "<%= yeoman.dist %>/public/images"
        ]

    htmlmin:
      dist:
        options: {}

        #collapseWhitespace: true,
        #collapseBooleanAttributes: true,
        #removeCommentsFromCDATA: true,
        #removeOptionalTags: true
        files: [
          expand: true
          cwd: "<%= yeoman.app %>/views"
          src: [
            "*.html"
            "partials/**/*.html"
          ]
          dest: "<%= yeoman.dist %>/views"
        ]

    # Allow the use of non-minsafe AngularJS files. Automatically makes it
    # minsafe compatible so Uglify does not destroy the ng references
    ngmin:
      dist:
        files: [
          expand: true
          cwd: ".tmp/concat/scripts"
          src: "*.js"
          dest: ".tmp/concat/scripts"
        ]

    # Replace Google CDN references
    cdnify:
      dist:
        html: ["<%= yeoman.dist %>/views/*.html"]

    # Copies remaining files to places other tasks can use
    copy:
      dist:
        files: [
          {
            expand: true
            dot: true
            cwd: "<%= yeoman.app %>"
            dest: "<%= yeoman.dist %>/public"
            src: [
              "*.{ico,png,txt}"
              ".htaccess"
              "bower_components/**/*"
              "images/{,*/}*.{webp}"
              "fonts/**/*"
            ]
          }
          {
            expand: true
            dot: true
            cwd: "<%= yeoman.app %>/views"
            dest: "<%= yeoman.dist %>/views"
            src: "**/*.jade"
          }
          {
            expand: true
            cwd: ".tmp/images"
            dest: "<%= yeoman.dist %>/public/images"
            src: ["generated/*"]
          }
          {
            expand: true
            dest: "<%= yeoman.dist %>"
            src: [
              "package.json"
              "server.js"
              "lib/**/*"
            ]
          }
        ]

      styles:
        expand: true
        cwd: "<%= yeoman.app %>/styles"
        dest: ".tmp/styles/"
        src: "{,*/}*.css"

    # Run some tasks in parallel to speed up the build process
    concurrent:
      server: [
        "coffee:dist"
        "compass:server"
      ]
      test: [
        "coffee"
        "compass"
      ]
      dist: [
        "coffee"
        "compass:dist"
        "imagemin"
        "svgmin"
        "htmlmin"
      ]

    # By default, your `index.html`'s <!-- Usemin block --> will take care of
    # minification. These next options are pre-configured if you do not wish
    # to use the Usemin blocks.
    # cssmin: {
    #   dist: {
    #     files: {
    #       '<%= yeoman.dist %>/styles/main.css': [
    #         '.tmp/styles/{,*/}*.css',
    #         '<%= yeoman.app %>/styles/{,*/}*.css'
    #       ]
    #     }
    #   }
    # },
    # uglify: {
    #   dist: {
    #     files: {
    #       '<%= yeoman.dist %>/scripts/scripts.js': [
    #         '<%= yeoman.dist %>/scripts/scripts.js'
    #       ]
    #     }
    #   }
    # },
    # concat: {
    #   dist: {}
    # },
    # Test settings
    karma:
      unit:
        configFile: "karma.conf.js"
        singleRun: true

    mochaTest:
      test:
        options:
          reporter: "spec"
          clearRequireCache: true

        src: [
          "lib/models/*.js"
          "lib/controllers/*.js"
          "test/lib_spec/**/*.js"
        ]

    exec:
      git_stash_dist:
        cmd: "git stash"
        cwd: "dist"

      git_fetch_dist:
        cmd: "git fetch heroku"
        cwd: "dist"

      git_pull_dist:
        cmd: "git pull heroku master"
        cwd: "dist"

      git_stash_pop_dist:
        cmd: "git stash pop"
        cwd: "dist"

      git_add_dist:
        cmd: "git add -A"
        cwd: "dist"

      git_status:
        cmd: "git status"
        cwd: "dist"

      git_commit_dist:
        cmd: "git commit -m \"heroku deploy\""
        cwd: "dist"

      git_push_dist_heroku:
        cmd: "git push heroku master"
        cwd: "dist"

      git_reset_hard_heroku_master:
        cmd: "git reset --hard heroku/master"
        cwd: "dist"


  # On watch events, if the changed file is a test file then configure mochaTest to only
  # run the tests from that file. Otherwise run all the tests
  mochaTestSrc = grunt.config("mochaTest.test.src")
  grunt.event.on "watch", (action, filepath) ->
    grunt.config "mochaTest.test.src", mochaTestSrc
    grunt.config "mochaTest.test.src", filepath  if filepath.match("test/")
    return


  # Used for delaying livereload until after server has restarted
  grunt.registerTask "wait", ->
    grunt.log.ok "Waiting for server reload..."
    done = @async()
    setTimeout (->
      grunt.log.writeln "Done waiting!"
      done()
      return
    ), 500
    return

  grunt.registerTask "express-keepalive", "Keep grunt running", ->
    @async()
    return

  grunt.registerTask "serve", ->
    mongod()  unless grunt.option("no-mongo")
    if grunt.option("target") is "dist"
      return grunt.task.run([
        "build"
        "express:prod"
        "open"
        "express-keepalive"
      ])
    grunt.task.run [
      "clean:server"
      "bower-install"
      "concurrent:server"
      "autoprefixer"
      "express:dev"
      "open"
      "watch"
    ]
    return

  grunt.registerTask "server", ->
    grunt.log.warn "The `server` task has been deprecated. Use `grunt serve` to start a server."
    grunt.task.run ["serve"]
    return

  grunt.registerTask "test", [
    "clean:server"
    "concurrent:test"
    "autoprefixer"
    "karma"
    "mochaTest"
  ]

  grunt.registerTask "build", [
    "clean:dist"
    "bower-install"
    "useminPrepare"
    "concurrent:dist"
    "autoprefixer"
    "concat"
    "ngmin"
    "copy:dist"
    "cdnify"
    "cssmin"
    "uglify"
    "rev"
    "usemin"
  ]

  grunt.registerTask "deploy", ->
    cb = @async()
    q = [
      type: "confirm"
      name: "ok"
      message: "Ready to deploy"
      default: false
    ]
    inquirer.prompt q, (a) ->
      if a.ok
        grunt.log.ok "proceeding with deployment"
        grunt.task.run [
          "exec:git_commit_dist"
          "exec:git_push_dist_heroku"
        ]
      else
        grunt.log.warn "stopping deployment."
        grunt.task.run ["exec:git_reset_hard_heroku_master"]
      cb()
      return

    return

  grunt.registerTask "heroku", [
    'test'
    "build"
    "exec:git_add_dist"
    "exec:git_stash_dist"
    "exec:git_fetch_dist"
    "exec:git_pull_dist"
    "exec:git_stash_pop_dist"
    "exec:git_add_dist"
    "exec:git_status"
    "deploy"
  ]

  grunt.registerTask "default", [
    "newer:jshint"
    "test"
    "build"
  ]

  grunt.registerTask "run-bower-install", "runs bower install as from the command line", ->
    exec = require("child_process").exec
    cb = @async()
    exec "bower install", {}, (err, stdout, stderr) ->
      logExec err, stdout, stderr
      cb()
      return

    return

  grunt.registerTask "run-npm-install", "runs npm install as from the command line", ->
    cb = @async()
    exec "npm install", {}, (err, stdout, stderr) ->
      logExec err, stdout, stderr
      cb()
      return

    return

  grunt.registerTask "reinstall", [
    "clean:bower"
    "clean:npm"
    "run-npm-install"
    "run-bower-install"
  ]
  return
