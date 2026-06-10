def is_isomorphic(s, t)
  st = {}
  ts = {}
  s.length.times do |i|
    a = s[i]
    b = t[i]
    return false if st[a] != ts[b]
    st[a] = i
    ts[b] = i
  end
  true
end
