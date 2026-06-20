# @param {String} board
# @param {String} hand
# @return {Integer}
def find_min_step(board, hand)
    remove_same = lambda do |s, i|
        return s if i < 0
        left = right = i
        while left > 0 && s[left - 1] == s[i]
            left -= 1
        end
        while right + 1 < s.length && s[right + 1] == s[i]
            right += 1
        end
        length = right - left + 1
        if length >= 3
            new_s = s[0...left] + s[right + 1..-1]
            return remove_same.call(new_s, left - 1)
        end
        s
    end

    hand = hand.chars.sort.join
    q = [[board, hand, 0]]
    visited = Set.new
    visited.add([board, hand])

    while !q.empty?
        curr_board, curr_hand, step = q.shift
        (0..curr_board.length).each do |i|
            (0...curr_hand.length).each do |j|
                next if j > 0 && curr_hand[j] == curr_hand[j - 1]
                next if i > 0 && curr_board[i - 1] == curr_hand[j]

                pick = false
                if i < curr_board.length && curr_board[i] == curr_hand[j]
                    pick = true
                end
                if i > 0 && i < curr_board.length &&
                   curr_board[i - 1] == curr_board[i] &&
                   curr_board[i] != curr_hand[j]
                    pick = true
                end

                if pick
                    new_board = remove_same.call(
                        curr_board[0...i] + curr_hand[j] + curr_board[i..-1], i
                    )
                    new_hand = curr_hand[0...j] + curr_hand[j + 1..-1]
                    return step + 1 if new_board.empty?
                    unless visited.include?([new_board, new_hand])
                        q.push([new_board, new_hand, step + 1])
                        visited.add([new_board, new_hand])
                    end
                end
            end
        end
    end
    -1
end
