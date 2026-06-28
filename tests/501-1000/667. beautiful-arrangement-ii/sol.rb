# @param {Integer} n
# @param {Integer} k
# @return {Integer[]}
def construct_array(n, k)
    ans = (1..n - k).to_a
    (0...k).each do |i|
        diff = i / 2 + 1
        if i % 2 == 0
            ans.push(n - diff + 1)
        else
            ans.push(n - k + diff)
        end
    end
    ans
end
