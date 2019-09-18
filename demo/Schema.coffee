schema = new Schema()

schema.bin('ok')
schema.str('user.name').default('kid').enum('A', 'B', 'C')
schema.num('user.age').default(18).min(10).max(60)
schema.arr('user.color').min(3)
schema.num('user.color.0').default(126).min(0).max(255)
schema.num('user.color.1').default(126).min(0).max(255)
schema.num('user.color.2').default(126).min(0).max(255)

console.log schema.format({})