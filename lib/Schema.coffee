{ get, set } = require('lodash')

module.exports = class Schema
   constructor: -> @rules = []
   bin:  (name) -> @rules.push(rule = new RuleBin(name)); rule
   num:  (name) -> @rules.push(rule = new RuleNum(name)); rule
   str:  (name) -> @rules.push(rule = new RuleStr(name)); rule
   arr:  (name) -> @rules.push(rule = new RuleArr(name)); rule

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

class RuleBin extends Rule
   constructor: (name) -> super(name).add(@type).replace=false
class RuleNum extends Rule
   constructor: (name) -> super(name).add(@type).replace=0
class RuleStr extends Rule
   constructor: (name) -> super(name).add(@type).replace=''
class RuleArr extends Rule
   constructor: (name) -> super(name).add(@type).replace=->[]

RuleBin::type = (b) -> typeof(b) is 'boolean'
RuleNum::type = (n) -> typeof(n) is 'number'
RuleStr::type = (s) -> typeof(s) is 'string'
RuleArr::type = (a) -> Array.isArray(a)

RuleNum::min = (min) -> @add (n) -> n >= min
RuleNum::max = (max) -> @add (n) -> n >= max
RuleStr::min = (min) -> @add (s) -> s.length >= min
RuleStr::max = (max) -> @add (s) -> s.length <= max
RuleArr::min = (min) -> @add (a) -> a.length >= min
RuleArr::max = (max) -> @add (a) -> a.length <= max