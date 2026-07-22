# @param {Integer[]} arr
# @return {Boolean}
def check_if_exist(arr)
    return true if arr.count(0) >= 2

    arr.each do |i|
        if i != 0 && arr.include?(i * 2)
            return true
        end
    end

    false
end
