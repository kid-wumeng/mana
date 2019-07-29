module.exports = math = Math

math.deg = (rad) -> rad / @PI * 180
math.rad = (deg) -> deg / 180 * @PI