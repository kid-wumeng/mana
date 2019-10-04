ctx = document.body.appendChild(document.createElement('canvas').move(0).fixed().color(0)).getContext('2d')
gl  = document.body.appendChild(document.createElement('canvas').move(0).fixed().index(0)).getContext('webgl2')

do ->
   texture_set = await new TextureSet(ctx, gl)
      .set('img-1', '/assets/img-1.png')
      .set('img-2', '/assets/img-2.png')
      .set('img-3', '/assets/img-3.png')
      .set('img-4', '/assets/img-4.png')
      .run(-> console.log 'before create table/ids, @views:\n\n', @views, '\n\n')