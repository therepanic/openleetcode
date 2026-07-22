# @param {Integer[]} arr
# @return {Integer}
def find_special_integer(arr)
    n = arr.length
    q = n / 4
    m = {}
    arr.each do |num|
        m[num] = (m[num] || 0) + 1
        if m[num] > q
            return num
        end
    end
    nil
end
