module.exports = class Color
   constructor: (@r=0, @g=0, @b=0, @a=1) ->

   add_me: (s) -> @r+=s; @g+=s; @b+=s; @
   sub_me: (s) -> @r-=s; @g-=s; @b-=s; @
   mul_me: (s) -> @r*=s; @g*=s; @b*=s; @
   div_me: (s) -> @r/=s; @g/=s; @b/=s; @

   add: (s) -> @clone.add_me(s)
   sub: (s) -> @clone.sub_me(s)
   mul: (s) -> @clone.mul_me(s)
   div: (s) -> @clone.div_me(s)

get Color::, 'normal_me', -> @div_me(255)
get Color::, 'normal',    -> @clone.normal_me
get Color::, 'clone',     -> new Color(@r,@g,@b,@a)