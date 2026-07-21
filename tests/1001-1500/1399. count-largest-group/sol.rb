# @param {Integer} n
# @return {Integer}
def count_largest_group(n)
    mpp = {}
    maxi = 0
    count = 0

    (1..n).each do |i|
        x = digsum(i)
        mpp[x] = (mpp[x] || 0) + 1
        maxi = [maxi, mpp[x]].max
    end

    mpp.values.each do |v|
        count += 1 if v == maxi
    end
    count
end

def digsum(n)
    s = 0
    while n > 0
        s += n % 10
        n /= 10
    end
    s
end
