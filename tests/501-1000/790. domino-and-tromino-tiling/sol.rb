# @param {Integer} n
# @return {Integer}
def num_tilings(n)
  mod = 10**9 + 7
  return 1 if n == 0
  return 1 if n == 1
  return 2 if n == 2

  multiply = ->(a, b) {
    c = Array.new(3) { Array.new(3, 0) }
    (0...3).each do |i|
      (0...3).each do |j|
        s = 0
        (0...3).each do |k|
          s = (s + a[i][k] * b[k][j]) % mod
        end
        c[i][j] = s
      end
    end
    c
  }

  power = ->(base, exp) {
    result = [[1,0,0],[0,1,0],[0,0,1]]
    while exp > 0
      if exp & 1 == 1
        result = multiply.call(result, base)
      end
      base = multiply.call(base, base)
      exp >>= 1
    end
    result
  }

  t = [[2,0,1],[1,0,0],[0,1,0]]
  p = power.call(t, n - 2)
  (p[0][0] * 2 + p[0][1] + p[0][2]) % mod
end
