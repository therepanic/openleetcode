def group_anagrams(strs)
  groups = {}
  keys = []

  strs.each do |word|
    key = word.chars.sort.join
    unless groups.key?(key)
      groups[key] = []
      keys << key
    end
    groups[key] << word
  end

  keys.map { |key| groups[key] }
end
