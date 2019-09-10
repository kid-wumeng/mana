require('../')

do ->
   images = await new ImageLoader()
      .set('test-1', '/demo/assets/test-1.png')
      .set('test-2', '/demo/assets/test-2.png')
      .load()

   console.log images