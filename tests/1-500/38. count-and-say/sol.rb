def count_and_say(n)
  current = "1"
  (n - 1).times do
    next_value = ""
    i = 0
    while i < current.length
      j = i
      j += 1 while j < current.length && current[j] == current[i]
      next_value << (j - i).to_s << current[i]
      i = j
    end
    current = next_value
  end
  current
end
