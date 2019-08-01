module.exports = class Vector4

   constructor: (@x=0, @y=0, @z=0, @w=0) ->

   add_me: (v) -> @x+=v.x; @y+=v.y; @z+=v.z; @
   sub_me: (v) -> @x-=v.x; @y-=v.y; @z-=v.z; @
   mul_me: (s) -> @x*=s; @y*=s; @z*=s; @
   div_me: (s) -> @x/=s; @y/=s; @z/=s; @

   add: (v) -> @clone.add_me(v)
   sub: (v) -> @clone.sub_me(v)
   mul: (v) -> @clone.mul_me(v)
   div: (v) -> @clone.div_me(v)
   dot: (v) -> @x*v.x + @y*v.y + @z*v.z

   dist:         (v) -> math.sqrt(@dist_square(v))
   dist_square:  (v) -> @sub(v).len_square
   dist_inverse: (v) -> @sub(v).len_inverse

get Vector4::, 'len',         -> math.sqrt(@len_square)
get Vector4::, 'len_square',  -> @x**2 + @y**2 + @z**2
get Vector4::, 'len_inverse', -> if len = @len then 1/len else 0
get Vector4::, 'negate_me',   -> @mul_me(-1)
get Vector4::, 'normal_me',   -> @mul_me(@len_inverse)
get Vector4::, 'negate',      -> @clone.negate_me
get Vector4::, 'normal',      -> @clone.normal_me
get Vector4::, 'clone',       -> new Vector4(@x,@y,@z,@w)