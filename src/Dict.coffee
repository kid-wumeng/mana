module.exports = class Dict extends Map

   forEach: (cb) ->
      super (value, name, dict) -> cb(name, value, dict)
      return @

   add: (dict) ->
      dict.forEach((name, value) => @set(name, value))
      return @

   map: (cb) ->
      dict = new @constructor
      @forEach((name, value) -> dict.set(name, cb(name, value)))
      return dict

   filter: (cb) ->
      dict = new @constructor
      @forEach((name, value) -> dict.set(name, value) if cb(name, value))
      return dict

Dict.demo = ->
   fruits = new Dict().set('orange', 2).set('banana', 3)
   drinks = new Dict().set('coffee', 5)
   console.log fruits.add(drinks)
   console.log fruits.map((name, price) -> price * 2)
   console.log fruits.filter((name, price) -> price > 2)