def find_substring(s, words)
  return [] if s.empty? || words.empty?

  word_len = words[0].length
  word_count = words.length
  target = Hash.new(0)
  words.each { |word| target[word] += 1 }
  ans = []

  (0...word_len).each do |offset|
    left = offset
    right = offset
    window = Hash.new(0)
    used = 0

    while right + word_len <= s.length
      word = s[right, word_len]
      right += word_len

      if target.key?(word)
        window[word] += 1
        used += 1
        while window[word] > target[word]
          left_word = s[left, word_len]
          window[left_word] -= 1
          left += word_len
          used -= 1
        end
        if used == word_count
          ans << left
          left_word = s[left, word_len]
          window[left_word] -= 1
          left += word_len
          used -= 1
        end
      else
        window.clear
        used = 0
        left = right
      end
    end
  end

  ans
end
