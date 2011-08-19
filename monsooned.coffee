Object::clone = (obj = @) ->
  if not obj? or typeof obj isnt 'object'
    return obj
  
  newInstance = new obj.constructor()
  for key of obj
    newInstance[key] = Object::clone obj[key]
  return newInstance


String::downcase = -> @toLowerCase()
String::upcase = -> @toUpperCase()
# String::find = (str)  -> if (t = @.indexOf(e)) > -1
String::strip = -> if String::trim? then @trim() else @replace /^\s+|\s+$/g, ""
String::lstrip = -> @replace /^\s+/g, ""
String::rstrip = -> @replace /\s+$/g, ""



Array::remove = (e) -> @[t..t] = [] if (t = @.indexOf(e)) > -1
Array::max = ->
  @reduce (a,b) -> Math.max a, b
Array::shuffle = -> @sort -> 0.5 - Math.random()  
Array::merge = (other) -> Array::push.apply @, other
Array::unique = ->
  output = {}
  output[@[key]] = @[key] for key in [0...@length]
  value for key, value of output
