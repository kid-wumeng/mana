module.exports = class Matrix4 extends Float32Array

   constructor: (elements=[]) ->
      super(16)
      @init()
      @[i]=el for el,i in elements

   init: -> @set([
      1, 0, 0, 0
      0, 1, 0, 0
      0, 0, 1, 0
      0, 0, 0, 1
   ]); @

   connect: (m) ->
      A11=@[0]; A12=@[1]; A13=@[2]; A14=@[3]; A21=@[4]; A22=@[5]; A23=@[6]; A24=@[7]; A31=@[8]; A32=@[9]; A33=@[10]; A34=@[11]
      B11=m[0]; B12=m[1]; B13=m[2]; B14=m[3]; B21=m[4]; B22=m[5]; B23=m[6]; B24=m[7]; B31=m[8]; B32=m[9]; B33=m[10]; B34=m[11]; B41=m[12]; B42=m[13]; B43=m[14]; B44=m[15]
      @[0]=A11*B11+A12*B21+A13*B31+A14*B41; @[1]=A11*B12+A12*B22+A13*B32+A14*B42; @[2] =A11*B13+A12*B23+A13*B33+A14*B43; @[3] =A11*B14+A12*B24+A13*B34+A14*B44
      @[4]=A21*B11+A22*B21+A23*B31+A24*B41; @[5]=A21*B12+A22*B22+A23*B32+A24*B42; @[6] =A21*B13+A22*B23+A23*B33+A24*B43; @[7] =A21*B14+A22*B24+A23*B34+A24*B44
      @[8]=A31*B11+A32*B21+A33*B31+A34*B41; @[9]=A31*B12+A32*B22+A33*B32+A34*B42; @[10]=A31*B13+A32*B23+A33*B33+A34*B43; @[11]=A31*B14+A32*B24+A33*B34+A34*B44
      @

   transform: (v) ->
      { x, y, z, w } = v
      switch
         when v instanceof Vector2 then v.x=@[0]*x+@[1]*y+@[3];          v.y=@[4]*x+@[5]*y+@[7]
         when v instanceof Vector3 then v.x=@[0]*x+@[1]*y+@[2]*z+@[3];   v.y=@[4]*x+@[5]*y+@[6]*z+@[7];   v.z=@[8]*x+@[9]*y+@[10]*z+@[11]
         when v instanceof Vector4 then v.x=@[0]*x+@[1]*y+@[2]*z+@[3]*w; v.y=@[4]*x+@[5]*y+@[6]*z+@[7]*w; v.z=@[8]*x+@[9]*y+@[10]*z+@[11]*w; v.w=@[12]*x+@[13]*y+@[14]*z+@[15]*w
      @

get Matrix4::, 'clone', -> new Matrix4(@)