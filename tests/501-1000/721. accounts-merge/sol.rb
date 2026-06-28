# @param {String[][]} accounts
# @return {String[][]}
def accounts_merge(accounts)
    n = accounts.length
    location = Hash.new { |h, k| h[k] = Set.new }
    content = []
    
    (0...n).each do |i|
        name = accounts[i][0]
        location[name].add(i)
        content << Set.new(accounts[i][1..-1])
    end
    
    location.each do |name, indices|
        indices.to_a.each do |i|
            next unless indices.include?(i)
            indices.to_a.each do |j|
                if i != j && !(content[i] & content[j]).empty?
                    content[j].merge(content[i])
                    indices.delete(i)
                    break
                end
            end
        end
    end
    
    result = []
    location.each do |name, indices|
        indices.each do |idx|
            result << [name] + content[idx].to_a.sort
        end
    end
    result
end
