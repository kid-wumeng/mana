{ GET } = require('./Helper')

module.exports = Image

GET Image::, 'w', -> @width
GET Image::, 'h', -> @height