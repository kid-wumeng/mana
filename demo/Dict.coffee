fruits = new Dict().set('orange', 2).set('banana', 3)
drinks = new Dict().set('coffee', 5)

console.log fruits.add(drinks)
console.log fruits.map((name, price) -> price * 2)
console.log fruits.filter((name, price) -> price > 2)