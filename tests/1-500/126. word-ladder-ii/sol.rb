def find_ladders(begin_word, end_word, word_list)
  word_set = word_list.to_set
  return [] unless word_set.include?(end_word)

  parents = Hash.new { |h, k| h[k] = [] }
  current_level = Set.new([begin_word])
  visited = Set.new([begin_word])
  found = false

  until current_level.empty? || found
    next_level = Set.new
    current_level.each do |word|
      chars = word.chars
      (0...chars.length).each do |i|
        original = chars[i]
        ('a'..'z').each do |ch|
          chars[i] = ch
          candidate = chars.join
          next unless word_set.include?(candidate)
          next unless !visited.include?(candidate) || next_level.include?(candidate)
          parents[candidate] << word
          unless next_level.include?(candidate)
            next_level.add(candidate)
          end
          found = true if candidate == end_word
        end
        chars[i] = original
      end
    end
    visited.merge(next_level)
    current_level = next_level
  end

  return [] unless found

  result = []
  path = [end_word]
  dfs = lambda do |word|
    if word == begin_word
      result << path.reverse
      return
    end
    parents[word].each do |parent|
      path << parent
      dfs.call(parent)
      path.pop
    end
  end
  dfs.call(end_word)
  result
end
