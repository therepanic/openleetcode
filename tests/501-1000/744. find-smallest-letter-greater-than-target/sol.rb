# @param {Character[]} letters
# @param {Character} target
# @return {Character}
def next_greatest_letter(letters, target)
    res = letters[0]
    flag = false

    letters.each do |ch|
        if !flag
            if ch > target
                res = ch
                flag = !flag
            end
        else
            if ch > target && ch < res
                res = ch
            end
        end
    end

    res
end
