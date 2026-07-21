# @param {String} target
# @return {String}
def alphabet_board_path(target)
    arr = [[0,1,2,3,4],[5,6,7,8,9],[10,11,12,13,14],[15,16,17,18,19],[20,21,22,23,24],[25]]
    word = target.chars.map { |c| c.ord - 97 }
    s = ''
    j = k = 0
    if word[0] % 5 != 0
        s += 'D' * (word[0] / 5)
    else
        s += 'D' * (word[0] / 5)
    end
    if word[0] % 5 >= 0
        s += 'R' * (word[0] % 5)
    end
    s += '!'
    (1...word.length).each do |i|
        arr.each_with_index do |row, h|
            row.each_with_index do |val, l|
                if val == word[i-1]
                    j = h
                end
                if val == word[i]
                    k = h
                end
            end
        end
        if word[i-1] == 25
            if j > k
                s += 'U' * (j - k)
            else
                s += 'D' * (k - j)
            end
            if word[i] % 5 >= word[i-1] % 5
                s += 'R' * (word[i] % 5 - word[i-1] % 5)
            else
                s += 'L' * (word[i-1] % 5 - word[i] % 5)
            end
        else
            if word[i] % 5 >= word[i-1] % 5
                s += 'R' * (word[i] % 5 - word[i-1] % 5)
            else
                s += 'L' * (word[i-1] % 5 - word[i] % 5)
            end
            if j > k
                s += 'U' * (j - k)
            else
                s += 'D' * (k - j)
            end
        end
        s += '!'
    end
    return s
end
