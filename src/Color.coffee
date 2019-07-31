module.exports = class Color extends Quartette

   normal:    -> @clone.normal_me()
   normal_me: -> @div_me(255)

Object.defineProperty Color::, 'r', get: (-> @get(0)), set: (n)-> @set(0,n)
Object.defineProperty Color::, 'g', get: (-> @get(1)), set: (n)-> @set(1,n)
Object.defineProperty Color::, 'b', get: (-> @get(2)), set: (n)-> @set(2,n)
Object.defineProperty Color::, 'a', get: (-> @[3] ?1), set: (n)-> @set(3,n)

Object.defineProperty Color::, 'rgb',  get: -> "rgb(#{@r},#{@g},#{@b})"
Object.defineProperty Color::, 'rgba', get: -> "rgba(#{@r},#{@g},#{@b},#{@a})"