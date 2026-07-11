# @param {String} num
# @return {Integer[]}
def split_into_fibonacci(num)
  invalid = lambda do |x|
    (x[0] == '0' && x.length > 1) || x.to_i >= (1 << 31)
  end

  check = lambda do |a0, a1, num_str|
    i = 0
    ret = [a0.to_i, a1.to_i]
    while i < num_str.length
      a0_int = a0.to_i
      a1_int = a1.to_i
      res = (a0_int + a1_int).to_s
      j = 0
      while i < num_str.length && j < res.length && res[j] == num_str[i]
        j += 1
        i += 1
      end
      if j < res.length || invalid.call(res)
        return []
      end
      a0, a1 = a1, res
      ret.push(res.to_i)
    end
    ret
  end

  n = num.length
  (1...n-1).each do |j|
    (0...j).each do |i|
      a0 = num[0..i]
      a1 = num[i+1..j]
      next if invalid.call(a0) || invalid.call(a1)
      ret = check.call(a0, a1, num[j+1..-1])
      return ret unless ret.empty?
    end
  end
  []
end
