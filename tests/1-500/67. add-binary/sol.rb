def add_binary(a, b)
  i = a.length - 1
  j = b.length - 1
  carry = 0
  res = []

  while i >= 0 || j >= 0 || carry > 0
    sum = carry
    if i >= 0
      sum += a.getbyte(i) - 48
      i -= 1
    end
    if j >= 0
      sum += b.getbyte(j) - 48
      j -= 1
    end
    res << ((sum % 2) + 48).chr
    carry = sum / 2
  end

  res.reverse.join
end
