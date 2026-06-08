def multiply(num1, num2)
  n = num1.length
  m = num2.length
  result = Array.new(n + m, 0)

  (n - 1).downto(0) do |i|
    (m - 1).downto(0) do |j|
      mul = (num1[i].ord - '0'.ord) * (num2[j].ord - '0'.ord)
      sum = mul + result[i + j + 1]
      result[i + j + 1] = sum % 10
      result[i + j] += sum / 10
    end
  end

  k = 0
  k += 1 while k < result.length && result[k] == 0
  return "0" if k == result.length

  result[k..].join
end
