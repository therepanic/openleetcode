def longest_substring(s, k)
  longest_len = 0
  n = s.length

  (1..26).each do |target_unique_chars|
    char_freq = Array.new(26, 0)
    unique_chars = 0
    chars_meeting_k_freq = 0
    left = 0

    (0...n).each do |right|
      curr_idx = s[right].ord - 'a'.ord

      if char_freq[curr_idx] == 0
        unique_chars += 1
      end
      if char_freq[curr_idx] == k - 1
        chars_meeting_k_freq += 1
      end

      char_freq[curr_idx] += 1

      while unique_chars > target_unique_chars
        left_idx = s[left].ord - 'a'.ord

        if char_freq[left_idx] == 1
          unique_chars -= 1
        end
        if char_freq[left_idx] == k
          chars_meeting_k_freq -= 1
        end

        char_freq[left_idx] -= 1
        left += 1
      end

      if unique_chars == target_unique_chars && chars_meeting_k_freq == unique_chars
        longest_len = [longest_len, right - left + 1].max
      end
    end
  end

  longest_len
end

def longestSubstring(s, k)
  longest_substring(s, k)
end
