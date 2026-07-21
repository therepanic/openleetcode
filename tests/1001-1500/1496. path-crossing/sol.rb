# @param {String} path
# @return {Boolean}
def is_path_crossing(path)
    pos = [[0, 0]]
    dic = {"N" => 1, "S" => -1, "E" => 1, "W" => -1}
    x = 0
    path.each_char do |i|
        left, right = pos[x]
        if i == "N" or i == "S"
            left += dic[i]
        else
            right += dic[i]
        end
        x += 1
        if pos.include?([left, right])
            return true
        end
        pos.append([left, right])
    end
    return false
end
