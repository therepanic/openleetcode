# @param {Integer[]} alice_sizes
# @param {Integer[]} bob_sizes
# @return {Integer[]}
def fair_candy_swap(alice_sizes, bob_sizes)
    sumA = alice_sizes.sum
    sumB = bob_sizes.sum
    diff = (sumB - sumA) / 2
    setB = bob_sizes.to_set
    alice_sizes.each do |a|
        if setB.include?(a + diff)
            return [a, a + diff]
        end
    end
end
