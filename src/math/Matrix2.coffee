module.exports = class Matrix2 extends Float32Array

   constructor: (elements=[]) ->
      super(4)
      @init()
      @[i]=el for el,i in elements

   init: -> @set([
      1, 0
      0, 1
   ]); @

   connect: (m) ->
      A11=@[0]; A12=@[1]; A21=@[2]; A22=@[3]
      B11=m[0]; B12=m[1]; B21=m[2]; B22=m[3]
      @[0]=A11*B11+A12*B21; @[1]=A11*B12+A12*B22
      @[2]=A21*B11+A22*B21; @[3]=A21*B12+A22*B22
      @

   transform: (v) ->
      x=v.x; y=v.y
      v.x=@[0]*x+@[1]*y
      v.y=@[2]*x+@[3]*y
      @

get Matrix2::, 'clone', -> new Matrix2(@)