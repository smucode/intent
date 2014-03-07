module.exports = (grunt) ->

  return unless grunt.option('silence')

  grunt.silencer ||= {}
  grunt.silencer.taskLog = {}
  currentTask = null

  warn_re = /\[33/
  error_re = /\[31/
  underline_re = /\[4m/

  group_re = /Running \"(.*)\"/

  grunt.util.hooker.hook process.stdout, 'write', (str) ->
    str = str.toString().trim()

    if match = str.match group_re
      currentTask = match[1]

    if currentTask
      (grunt.silencer.taskLog[currentTask] ||= []) .unshift str

    if (str.match(error_re) or str.match(warn_re)) and str.match(/abort|warn|err|fail/i)
      str = '\n' + str + '\n'
    else if str.match(underline_re)
      str = '\n' + str + '\n'
    else
      str = '.'

    return grunt.util.hooker.filter this, [str]
