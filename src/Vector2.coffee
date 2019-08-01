module.exports = class Vector2

   constructor: (@x=0, @y=0) ->

   add_me: (v) -> @x+=v.x; @y+=v.y; @
   sub_me: (v) -> @x-=v.x; @y-=v.y; @
   mul_me: (s) -> @x*=s; @y*=s; @
   div_me: (s) -> @x/=s; @y/=s; @

   add: (v) -> @clone.add_me(v)
   sub: (v) -> @clone.sub_me(v)
   mul: (s) -> @clone.mul_me(s)
   div: (s) -> @clone.div_me(s)
   dot: (v) -> @x*v.x + @y*v.y

   dist:         (v) -> math.sqrt(@dist_square(v))
   dist_square:  (v) -> @sub(v).len_square
   dist_inverse: (v) -> @sub(v).len_inverse

get Vector2::, 'len',         -> math.sqrt(@len_square)
get Vector2::, 'len_square',  -> @x**2 + @y**2
get Vector2::, 'len_inverse', -> if len = @len then 1/len else 0
get Vector2::, 'negate_me',   -> @mul_me(-1)
get Vector2::, 'normal_me',   -> @mul_me(@len_inverse)
get Vector2::, 'negate',      -> @clone.negate_me
get Vector2::, 'normal',      -> @clone.normal_me
get Vector2::, 'clone',       -> new Vector2(@x,@y)