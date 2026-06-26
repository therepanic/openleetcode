# @param {Integer} n
# @return {Integer}
def fib(n)
    sqrt5 = Math.sqrt(5)
    fibN = ((1 + sqrt5) / 2) ** n - ((1 - sqrt5) / 2) ** n
    return (fibN / sqrt5).round
end
