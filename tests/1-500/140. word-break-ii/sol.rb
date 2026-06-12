def word_break(s, word_dict)
  words = word_dict.to_set
  memo = {}
  solve = lambda do |text|
    return memo[text] if memo.key?(text)
    result = []
    result << text if words.include?(text)
    (1...text.length).each do |i|
      prefix = text[0...i]
      next unless words.include?(prefix)
      solve.call(text[i..-1]).each do |tail|
        result << prefix + ' ' + tail
      end
    end
    memo[text] = result
  end
  solve.call(s)
end
