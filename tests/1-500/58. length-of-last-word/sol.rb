def length_of_last_word(s)
  i = s.length - 1
  i -= 1 while i >= 0 && s[i] == ' '

  len = 0
  while i >= 0 && s[i] != ' '
    len += 1
    i -= 1
  end
  len
end
