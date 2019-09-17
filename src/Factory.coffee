Dict = require('./Dict')

module.exports = class Factory extends Dict
   create: (name, args...) -> new (@get(name))(args...)