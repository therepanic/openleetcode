def reverse_prefix(word, ch)
    idx = word.index(ch)
    return word if idx.nil?
    word[0..idx].reverse + word[(idx + 1)..]
end
