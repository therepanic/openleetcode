# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def kth_factor(n, k)
    ab = []
    (1..n).each do |i|
        ab << i if n % i == 0
    end
    return -1 if ab.length < k
    ab[k - 1]
end
