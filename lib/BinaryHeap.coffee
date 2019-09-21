module.exports = class BinaryHeap

   constructor: ->
      @datas = []
      @sizes = []

   add: (data, size) ->
      @datas.push(data)
      @sizes.push(size)
      @upstream(data, size, @datas.length-1) if @datas.length > 1
      return @

   upstream: (data, size, i) ->
      datas=@datas
      sizes=@sizes
      while i > 0
         j = parseInt((i-1) >> 1)
         if size < sizes[j]
            datas[i]=datas[j]
            sizes[i]=sizes[j]
            i=j
         else
            break
      datas[i]=data
      sizes[i]=size
      return i

   pop: ->
      head=@datas[0]
      data=@datas.pop()
      size=@sizes.pop()
      if @datas.length
         @datas[0]=data
         @sizes[0]=size
         @downstream(data, size, 0) if @datas.length > 1
      return head

   downstream: (data, size, i) ->
      datas=@datas
      sizes=@sizes
      last=datas.length-1
      while (j=(i<<1)+1) <= last
         if j < last and sizes[j] > sizes[j+1]
            j++
         if size > sizes[j]
            datas[i]=datas[j]
            sizes[i]=sizes[j]
            i=j
         else
            break
      datas[i]=data
      sizes[i]=size
      return i

   update: (data, size) ->
      if (i=@datas.indexOf(data)) > -1
         @sizes[i]=size
         if @datas.length > 1
            i=@upstream(data, size, i)
            @downstream(data, size, i)
      return @

   clear: ->
      @datas = []
      @sizes = []
      return @

Object.defineProperty BinaryHeap::, 'length', get: -> @datas.length