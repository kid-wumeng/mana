module.exports = class Vector extends Quartette

   dot:         (v) -> math.sum(@[i]*v.get(i) for i in [0...@main_length])
   dist:        (v) -> math.sqrt(@dist_square(v))
   dist_square: (v) -> @sub(v).len_square
   normal:          -> @clone.normal_me()
   normal_me:       -> @mul_me(@len_inverse)

Object.defineProperty Vector::, 'x', get: (-> @get(0)), set: (n)-> @set(0,n)
Object.defineProperty Vector::, 'y', get: (-> @get(1)), set: (n)-> @set(1,n)
Object.defineProperty Vector::, 'z', get: (-> @get(2)), set: (n)-> @set(2,n)
Object.defineProperty Vector::, 'w', get: (-> @get(3)), set: (n)-> @set(3,n)

Object.defineProperty Vector::, 'len',         get: -> math.sqrt(@len_square)
Object.defineProperty Vector::, 'len_square',  get: -> math.sum(@[i]**2 for i in [0...@main_length])
Object.defineProperty Vector::, 'len_inverse', get: -> if len = @len then 1/len else 0