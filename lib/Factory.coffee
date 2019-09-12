module.exports = class Factory extends Map

   create: (name, args...) ->
      return new (@get(name))(args...)