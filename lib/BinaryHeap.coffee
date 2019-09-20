module.exports = class BinaryHeap extends Array

   add: (data, weight=0) ->
      return @upstream(@push({data, weight})-1)

   top: ->
      head=@[0]
      last=@pop()
      if @length
         @[0]=last
         @downstream(0)
      return head

   change: (node, weight) ->
      switch
         when weight < node.weight then node.weight = weight; @upstream(@indexOf(node))
         when weight > node.weight then node.weight = weight; @downstream(@indexOf(node))
      return node

   upstream: (i) ->
      node=@[i]
      while i > 0
         j = parseInt (i-1)/2
         if node.weight < @[j].weight
            @[i]=@[j]; i=j
         else
            break
      return @[i]=node

   downstream: (i) ->
      node=@[i]
      last=@length-1
      while (j=i*2+1) <= last
         if j < last and @[j].weight > @[j+1].weight
            j = j+1
         if node.weight > @[j].weight
            @[i]=@[j]; i=j
         else
            break
      return @[i]=node