# @param {String[][]} favorite_companies
# @return {Integer[]}
def people_indexes(favorite_companies)
    sets = favorite_companies.map { |companies| companies.to_set }
    result = []
    
    sets.each_with_index do |s, i|
        is_subset = false
        sets.each_with_index do |t, j|
            if i != j && s.subset?(t)
                is_subset = true
                break
            end
        end
        result << i unless is_subset
    end
    
    result
end
