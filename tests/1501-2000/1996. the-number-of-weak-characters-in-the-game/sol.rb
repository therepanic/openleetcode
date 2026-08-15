# @param {Integer[][]} properties
# @return {Integer}
def number_of_weak_characters(properties)
    properties.sort_by! { |x| [-x[0], x[1]] }
    
    max_defense = 0
    weak_count = 0
    
    properties.each do |attack, defense|
        if defense < max_defense
            weak_count += 1
        else
            max_defense = defense
        end
    end
    
    weak_count
end
