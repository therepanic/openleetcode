def my_pow(x, n)
  exp = n
  if exp < 0
    x = 1.0 / x
    exp = -exp
  end

  ans = 1.0
  while exp > 0
    ans *= x if exp.odd?
    x *= x
    exp /= 2
  end
  ans
end
