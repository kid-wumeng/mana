module.exports = class Color

   constructor: (@r=0, @g=0, @b=0, @a=1) ->
   normalize: -> @r/=255; @g/=255; @b/=255

get Color::, 'clone', -> new Color(@r, @g, @b, @a)