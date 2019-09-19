module.exports = class BinaryHeap extends Array

   add: (data, weight) ->
      cursor = @length
      cursor_node = {data, weight}
      @push(cursor_node)
      while cursor > 0
         parent = parseInt((cursor-1)/2)
         parent_node = @[parent]
         if weight > parent_node.weight
            @[parent] = cursor_node
            @[cursor] = parent_node
            cursor = parent
         else
            break
      return @

   top: ->
      top = @[0]
      cursor_node = @pop()
      if @length
         @[0] = cursor_node
         cursor = 0
         bottom = 1
         while bottom <= @length-1
            bottom++ if bottom < @length-1 and @[bottom].weight < @[bottom+1].weight
            bottom_node = @[bottom]
            if cursor_node.weight < bottom_node.weight
               @[cursor] = bottom_node
               @[bottom] = cursor_node
               cursor = bottom
               bottom = bottom*2+1
            else
               break
      return top?.data