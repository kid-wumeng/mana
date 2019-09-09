{ get, set } = require('lodash')

module.exports = class Schema
   constructor: -> @rules = []
   B: (name) -> @rules.push(rule = new RuleB(name)); rule
   N: (name) -> @rules.push(rule = new RuleN(name)); rule
   S: (name) -> @rules.push(rule = new RuleS(name)); rule
   A: (name) -> @rules.push(rule = new RuleA(name)); rule

   format: (src) -> @rules.reduce (dst, {name, test, replace}) ->
      if test(value = get(src, name))
         set(dst, name, value)
      else
         set(dst, name, if replace instanceof Function then replace() else replace)
   , Object.create(null)

class Rule
   constructor: (name) -> @name=name; @tests=[]
   default:  (replace) -> @replace=replace;  @
   add:         (test) -> @tests.push(test); @
   enum:        (v...) -> @add((n)->v.includes(n))
   test:        (data) => @tests.every((test)->test(data))

class RuleB extends Rule
   constructor: (name) -> super(name).add(@type).replace=false
class RuleN extends Rule
   constructor: (name) -> super(name).add(@type).replace=0
class RuleS extends Rule
   constructor: (name) -> super(name).add(@type).replace=''
class RuleA extends Rule
   constructor: (name) -> super(name).add(@type).replace=->[]

RuleB::type = (b) -> typeof(b) is 'boolean'
RuleN::type = (n) -> typeof(n) is 'number'
RuleS::type = (s) -> typeof(s) is 'string'
RuleA::type = (a) -> Array.isArray(a)

RuleN::min = (min) -> @add (n) -> n >= min
RuleN::max = (max) -> @add (n) -> n >= max
RuleS::min = (min) -> @add (s) -> s.length >= min
RuleS::max = (max) -> @add (s) -> s.length <= max
RuleA::min = (min) -> @add (a) -> a.length >= min
RuleA::max = (max) -> @add (a) -> a.length <= max