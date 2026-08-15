# @param {String} word
# @return {Integer}
def min_time_to_type(word)
    answer = 0
    pointer = 'a'
    
    word.each_char do |char|
        clockwise = (char.ord - pointer.ord).abs
        counterclockwise = 26 - clockwise
        answer += [clockwise, counterclockwise].min + 1
        pointer = char
    end
    
    answer
end
