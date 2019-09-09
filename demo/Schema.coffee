require('../')

schema = new Schema()

schema.B('ok')
schema.S('user.name').enum('A', 'B', 'C')
schema.N('user.age').default(18).min(10).max(60)
schema.A('user.color').min(3)
schema.N('user.color[0]').default(126).min(0).max(255)
schema.N('user.color[1]').default(126).min(0).max(255)
schema.N('user.color[2]').default(126).min(0).max(255)

console.log schema.format({})