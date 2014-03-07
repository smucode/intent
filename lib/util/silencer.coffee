module.exports = (grunt) ->

  return unless grunt.option('silence')

  grunt.silencer ||= {}
  grunt.silencer.all = []

  warn_re = /\[33/
  error_re = /\[31/
  underline_re = /\[4m/

  grunt.util.hooker.hook process.stdout, 'write', (str) ->
    str = str.toString().trim()

    grunt.silencer.last = str
    grunt.silencer.all.unshift str

    if (str.match(error_re) or str.match(warn_re)) and str.match(/abort|warn|err|fail/i)
      str = '\n' + str + '\n'
    else if str.match(underline_re)
      str = '\n' + str + '\n'
    else
      str = '.'

    return grunt.util.hooker.filter this, [str]
