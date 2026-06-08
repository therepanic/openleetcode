def restore_ip_addresses(s)
  result = []

  backtrack = lambda do |index, current|
    if current.length == 4
      result << current.join('.') if index == s.length
      return
    end

    1.upto(3) do |length|
      break if index + length > s.length
      segment = s[index, length]
      next unless valid_segment?(segment)

      current << segment
      backtrack.call(index + length, current)
      current.pop
    end
  end

  backtrack.call(0, [])
  result
end

def valid_segment?(segment)
  return false if segment.length > 1 && segment[0] == '0'
  segment.to_i <= 255
end
