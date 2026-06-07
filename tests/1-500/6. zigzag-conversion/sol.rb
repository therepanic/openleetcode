def convert(s, num_rows)
  return s if num_rows == 1 || num_rows >= s.length

  rows = Array.new(num_rows) { '' }
  idx = 0
  step = 1

  s.each_char do |ch|
    rows[idx] << ch
    step = 1 if idx == 0
    step = -1 if idx == num_rows - 1
    idx += step
  end

  rows.join
end
