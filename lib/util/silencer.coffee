module.exports = (grunt, silence = true) ->

  return if grunt.option('s:off')
  unless grunt.option('s:on')
    return unless silence

  grunt.silencer ||= {}
  grunt.silencer.taskLog = {}
  grunt.silencer.enabled = true
  currentTask = null

  warn_re = /\[33/
  error_re = /\[31/
  underline_re = /\[4m/
  group_re = /Running \"(.*)\"/

  grunt.util.hooker.hook process.stdout, 'write', (str) ->
    if grunt.silencer.enabled
      str = str.toString().trim()

      if match = str.match group_re
        currentTask = match[1]

      if currentTask
        (grunt.silencer.taskLog[currentTask] ||= []).push str

      if (str.match(error_re) or str.match(warn_re)) and str.match(/abort|warn|err|fail/i)
        str = '\n' + str + '\n'
      else if match = str.match(group_re)
        str = '\n' + match[1]
      else
        str = '.'

    return grunt.util.hooker.filter this, [str]
