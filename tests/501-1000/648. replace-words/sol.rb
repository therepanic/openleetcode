require 'set'

# @param {String[]} dictionary
# @param {String} sentence
# @return {String}
def replace_words(dictionary, sentence)
  roots = dictionary.to_set
  sentence.split(" ").map do |word|
    replacement = word
    1.upto(word.length) do |len|
      prefix = word[0...len]
      if roots.include?(prefix)
        replacement = prefix
        break
      end
    end
    replacement
  end.join(" ")
end
