module.exports = class Animation

   constructor: (step=1) ->
      @frames = new FrameSequence()
      @metronome = new Metronome(step, => @frames.next())

   add: (cb) -> @frames.add(cb);   @
   init:     -> @frames.init();    @
   next:     -> @metronome.next(); @