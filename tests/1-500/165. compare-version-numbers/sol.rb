def compare_version(version1, version2)
  a = version1.split(".").map(&:to_i)
  b = version2.split(".").map(&:to_i)
  n = [a.length, b.length].max
  (0...n).each do |i|
    x = i < a.length ? a[i] : 0
    y = i < b.length ? b[i] : 0
    return -1 if x < y
    return 1 if x > y
  end
  0
end
