class TesterSprite
   constructor: (args...) -> console.log args...

testers = new Factory()
testers.set('sprite', TesterSprite)
testers.create('sprite', 'abc', 123, true)