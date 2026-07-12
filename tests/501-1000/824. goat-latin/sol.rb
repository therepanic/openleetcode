# @param {String} sentence
# @return {String}
def to_goat_latin(sentence)
  vowels = Set.new(['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'])
  words = sentence.split
  ans = []
  words.each_with_index do |word, idx|
    i = idx + 1
    if vowels.include?(word[0])
      goat = word + "ma"
    else
      goat = word[1..-1] + word[0] + "ma"
    end
    goat += "a" * i
    ans << goat
  end
  ans.join(" ")
end
