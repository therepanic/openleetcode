# @param {String} start_gene
# @param {String} end_gene
# @param {String[]} bank
# @return {Integer}
def min_mutation(start_gene, end_gene, bank)
    s = bank.to_set
    return -1 if !s.include?(end_gene) && start_gene != end_gene
    q = [[start_gene, 0]]
    v = Set.new([start_gene])
    while !q.empty?
        g, d = q.shift
        return d if g == end_gene
        (0...8).each do |i|
            'ACGT'.each_char do |c|
                if g[i] != c
                    n = g[0...i] + c + g[i+1..]
                    if s.include?(n) && !v.include?(n)
                        v.add(n)
                        q.push([n, d+1])
                    end
                end
            end
        end
    end
    -1
end
