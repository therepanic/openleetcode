def is_number(s)
  seen_digit = false
  seen_dot = false
  seen_exp = false
  seen_digit_after_exp = true

  s.each_char.with_index do |c, i|
    if c >= '0' && c <= '9'
      seen_digit = true
      seen_digit_after_exp = true
    elsif c == '.'
      return false if seen_dot || seen_exp
      seen_dot = true
    elsif c == 'e' || c == 'E'
      return false if seen_exp || !seen_digit
      seen_exp = true
      seen_digit_after_exp = false
    elsif c == '+' || c == '-'
      return false if i > 0 && s[i - 1] != 'e' && s[i - 1] != 'E'
    else
      return false
    end
  end

  seen_digit && seen_digit_after_exp
end
