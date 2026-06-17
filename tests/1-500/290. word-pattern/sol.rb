# @param {String} pattern
# @param {String} s
# @return {Boolean}
def word_pattern(pattern, s)
    words = s.split(" ")
    return false if pattern.length != words.length
    
    Set.new(pattern.chars).size == Set.new(words).size && 
    Set.new(pattern.chars.zip(words)).size == Set.new(pattern.chars).size
end
