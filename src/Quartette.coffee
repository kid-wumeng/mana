module.exports = class Quartette extends Buffer

   constructor: (a1, a2, a3, a4) ->
      switch arguments.length
         when 0 then super(1);
         when 1 then super(1).val(a1);
         when 2 then super(2).val(a1, a2);
         when 3 then super(3).val(a1, a2, a3);
         else        super(4).val(a1, a2, a3, a4);

   add: (v) -> @clone.add_me(v)
   sub: (v) -> @clone.sub_me(v)
   mul: (s) -> @clone.mul_me(s)
   div: (s) -> @clone.div_me(s)
   negate:  -> @clone.negate_me()

   add_me: (v) -> @map_me (n,i) -> n+v[i]
   sub_me: (v) -> @map_me (n,i) -> n-v[i]
   mul_me: (s) -> @map_me (n,i) -> n*s
   div_me: (s) -> @map_me (n,i) -> n/s
   negate_me:  -> @map_me (n,i) -> -n

   map_me: (cb) -> super.map_me(cb, 0, 2)

Object.defineProperty Quartette::, 'main_length', get: -> if (@length <= 3) then @length else 3
Object.defineProperty Quartette::, 'clone',       get: -> new @constructor(@...)