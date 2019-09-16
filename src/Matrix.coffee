module.exports = class Matrix extends Array

   constructor: ->
      super(3)
      @[0]=[1, 0, 0]
      @[1]=[0, 1, 0]
      @[2]=[0, 0, 1]

   concat: (m) ->
      A11=@[0][0]; A12=@[0][1]; A13=@[0][2]; A21=@[1][0]; A22=@[1][1]; A23=@[1][2]; A31=@[2][0]; A32=@[2][1]; A33=@[2][2]
      B11=m[0][0]; B12=m[0][1]; B13=m[0][2]; B21=m[1][0]; B22=m[1][1]; B23=m[1][2]; B31=m[2][0]; B32=m[2][1]; B33=m[2][2]
      C=new Matrix()
      C[0][0]=A11*B11+A12*B21+A13*B31; C[0][1]=A11*B12+A12*B22+A13*B32; C[0][2]=A11*B13+A12*B23+A13*B33;
      C[1][0]=A21*B11+A22*B21+A23*B31; C[1][1]=A21*B12+A22*B22+A23*B32; C[1][2]=A21*B13+A22*B23+A23*B33;
      C[2][0]=A31*B11+A32*B21+A33*B31; C[2][1]=A31*B12+A32*B22+A33*B32; C[2][2]=A31*B13+A32*B23+A33*B33;
      return C

   translate: (x=0, y=x) ->
      @[0][2] = x
      @[1][2] = y
      return @

   scale: (x=1, y=x) ->
      @[0][0] = x
      @[1][1] = y
      return @

   rotate: (a) ->
      @[0][0]=cos(a); @[0][1]=-sin(a)
      @[1][0]=sin(a); @[1][1]=cos(a)
      return @

   ortho: (l=0, t=0, w=0, h=0) ->
      @[0][0]=2/+w; @[0][2]=(2*l+w)/-w
      @[1][1]=2/-h; @[1][2]=(2*t+h)/+h
      return @

Object.defineProperty Matrix::, 'tx', get: -> @[0][2]
Object.defineProperty Matrix::, 'ty', get: -> @[1][2]
Object.defineProperty Matrix::, 'sx', get: -> @[0][0]
Object.defineProperty Matrix::, 'sy', get: -> @[1][1]
Object.defineProperty Matrix::, 'elements', get: -> [@[0]..., @[1]..., @[2]...]

Matrix.demo = ->
   console.log new Matrix().translate(100).concat(new Matrix().scale(2))
   console.log new Matrix().scale(2).concat(new Matrix().translate(100))