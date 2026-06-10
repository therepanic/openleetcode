def ladder_length(begin_word, end_word, word_list)
  word_set = word_list.to_set
  return 0 unless word_set.include?(end_word)
  queue = [[begin_word, 1]]
  until queue.empty?
    word, steps = queue.shift
    return steps if word == end_word
    (0...word.length).each do |i|
      prefix = word[0...i]
      suffix = word[(i + 1)..-1]
      ('a'..'z').each do |ch|
        candidate = prefix + ch + suffix.to_s
        if word_set.delete?(candidate)
          queue << [candidate, steps + 1]
        end
      end
    end
  end
  0
end
