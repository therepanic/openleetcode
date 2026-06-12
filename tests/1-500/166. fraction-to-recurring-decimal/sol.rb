def fraction_to_decimal(numerator, denominator)
  return "0" if numerator == 0
  result = +""
  result << "-" if (numerator < 0) ^ (denominator < 0)
  numerator = numerator.abs
  denominator = denominator.abs
  result << (numerator / denominator).to_s
  rem = numerator % denominator
  return result if rem == 0
  result << "."
  seen = {}
  while rem != 0
    if seen.key?(rem)
      result.insert(seen[rem], "(")
      result << ")"
      break
    end
    seen[rem] = result.length
    rem *= 10
    result << (rem / denominator).to_s
    rem %= denominator
  end
  result
end
