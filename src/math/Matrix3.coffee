GET = require('../GET')

module.exports = class Matrix3 extends Float32Array

   constructor: (elements=[]) ->
      super(9)
      @init()
      @[i]=el for el,i in elements

   init: -> @set([
      1, 0, 0
      0, 1, 0
      0, 0, 1
   ]); @

   inverse: ->
      if det = @det
         tx = @[2]; ty = @[5]
         @cofactor().transpose()
         @[0] /= det; @[1] /= det
         @[3] /= det; @[4] /= det
         @[2] = -(tx*@[0]+ty*@[3])
         @[5] = -(tx*@[1]+ty*@[4])
      @

   cofactor: ->
      m11=@[0]; m12=@[1]; m21=@[3]; m22=@[4]
      @[0]= m22; @[1]=-m21
      @[3]=-m12; @[4]= m11
      @

   transpose: ->
      m12=@[1]; @[1]=@[3]; @[3]=m12
      @

   concat: (m) ->
      A11=@[0]; A12=@[1]; A13=@[2]; A21=@[3]; A22=@[4]; A23=@[5]; A31=@[6]; A32=@[7]; A33=@[8]
      B11=m[0]; B12=m[1]; B13=m[2]; B21=m[3]; B22=m[4]; B23=m[5]; B31=m[6]; B32=m[7]; B33=m[8]
      @[0]=A11*B11+A12*B21+A13*B31; @[1]=A11*B12+A12*B22+A13*B32; @[2]=A11*B13+A12*B23+A13*B33
      @[3]=A21*B11+A22*B21+A23*B31; @[4]=A21*B12+A22*B22+A23*B32; @[5]=A21*B13+A22*B23+A23*B33
      @[6]=A31*B11+A32*B21+A33*B31; @[7]=A31*B12+A32*B22+A33*B32; @[8]=A31*B13+A32*B23+A33*B33
      @

   transform: (sv, dv) ->
      [ x, y ] = sv
      dv[0] = @[0]*x + @[1]*y + @[2]
      dv[1] = @[3]*x + @[4]*y + @[5]
      dv

GET Matrix3::, 'det',   -> @[0]*@[4]-@[1]*@[3]
GET Matrix3::, 'clone', -> new Matrix3(@)