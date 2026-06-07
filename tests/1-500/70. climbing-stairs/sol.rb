def climb_stairs(n)
  return n if n <= 3

  prev2 = 2
  prev1 = 3
  (4..n).each do
    cur = prev1 + prev2
    prev2 = prev1
    prev1 = cur
  end
  prev1
end
