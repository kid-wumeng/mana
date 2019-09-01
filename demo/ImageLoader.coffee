do ->
   images = await new ImageLoader()
      .add('test-1', '/demo/assets/test-1.png')
      .add('test-2', '/demo/assets/test-2.png')
      .load()

   console.log images