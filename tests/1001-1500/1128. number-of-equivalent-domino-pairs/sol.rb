# @param {Integer[][]} dominoes
# @return {Integer}
def num_equiv_domino_pairs(dominoes)
    mpp = Array.new(100, 0)
    count = 0
    dominoes.each do |a, b|
        key = a <= b ? a * 10 + b : b * 10 + a
        count += mpp[key]
        mpp[key] += 1
    end
    count
end
