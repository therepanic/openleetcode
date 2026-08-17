# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
def place_word_in_crossword(board, word)
    can_place = ->(segment, w) do
        return false if segment.length != w.length
        segment.chars.each_with_index.all? { |c, i| c == ' ' || c == w[i] }
    end
    
    m, n = board.length, board[0].length
    reversed_word = word.reverse

    board.each do |row|
        parts = row.join.split('#')
        parts.each do |part|
            return true if can_place.call(part, word) || can_place.call(part, reversed_word)
        end
    end

    (0...n).each do |j|
        col = (0...m).map { |i| board[i][j] }.join
        parts = col.split('#')
        parts.each do |part|
            return true if can_place.call(part, word) || can_place.call(part, reversed_word)
        end
    end

    false
end
