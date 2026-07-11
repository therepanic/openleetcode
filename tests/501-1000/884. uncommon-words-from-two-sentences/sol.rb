# @param {String} s1
# @param {String} s2
# @return {String[]}
def uncommon_from_sentences(s1, s2)
  words = (s1.split + s2.split)
  words.select { |word| words.count(word) == 1 }
end
