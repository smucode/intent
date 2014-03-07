module.exports = (grunt) ->

  return unless grunt.option('silence')

  failure = false

  info_re = /\[32/
  warn_re = /\[33/
  error_re = /\[31/
  underline_re = /\[4m/

  grunt.util.hooker.hook process.stdout, 'write', (str) ->
    str = str.toString()

    if str.match? error_re
      failure = true
      str = '\n' + str
    else if str.match?(warn_re) or str.match?(underline_re)
      str = '\n' + str
    else
      str = str.replace /^\w*/, ''
      str = '.' unless failure

    return grunt.util.hooker.filter this, [str]
