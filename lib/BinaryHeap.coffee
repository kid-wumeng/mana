Dict = require('./Dict')
List = require('./List')

module.exports = class BinaryHeap

   constructor: ->
      @dict = new Dict() # {data:node}
      @list = new List() # [node]

   set: (data, size) ->
      @dict.set(data, node={data, size})
      @list.add(node)
      @upstream(@list.length-1)
      return @

   change: (data, size) ->
      node=@dict.get(data)
      switch
         when size < node.size then node.size=size; @upstream(@list.indexOf(node))
         when size > node.size then node.size=size; @downstream(@list.indexOf(node))
      return @

   top: ->
      head=@list[0]
      last=@list.pop()
      if @list.length
         @list[0]=last
         @downstream(0)
      @dict.delete(data=head?.data)
      return data

   upstream: (i) ->
      node=@list[i]
      while i > 0
         j = parseInt (i-1)/2
         if node.size < @list[j].size
            @list[i]=@list[j]; i=j
         else
            break
      @list[i]=node

   downstream: (i) ->
      node=@list[i]
      last=@list.length-1
      while (j=i*2+1) <= last
         if j < last and @list[j].size > @list[j+1].size
            j++
         if node.size > @list[j].size
            @list[i]=@list[j]; i=j
         else
            break
      @list[i]=node