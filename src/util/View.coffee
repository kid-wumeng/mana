module.exports = class View extends require('../shape/Rect')

   constructor: (x, y, w, h, W, H) -> 
      super(x/W, y/H, w/W, h/H)