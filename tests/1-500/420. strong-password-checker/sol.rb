# @param {String} password
# @return {Integer}
def strong_password_checker(password)
    lowercase = Set.new('abcdefghijklmnopqrstuvwxyz'.chars)
    uppercase = Set.new('ABCDEFGHIJKLMNOPQRSTUVWXYZ'.chars)
    digit = Set.new('0123456789'.chars)
    
    characters = Set.new(password.chars)
    
    needs_lowercase = !(characters.intersect?(lowercase))
    needs_uppercase = !(characters.intersect?(uppercase))
    needs_digit = !(characters.intersect?(digit))
    num_required_type_replaces = (needs_lowercase ? 1 : 0) + (needs_uppercase ? 1 : 0) + (needs_digit ? 1 : 0)
    
    num_required_inserts = [0, 6 - password.length].max
    num_required_deletes = [0, password.length - 20].max
    
    groups = []
    count = 1
    (1...password.length).each do |i|
        if password[i] == password[i-1]
            count += 1
        else
            groups << count
            count = 1
        end
    end
    groups << count if password.length > 0
    
    num_required_deletes.times do
        argmin = nil
        min_val = nil
        groups.each_with_index do |group, idx|
            if group >= 3
                val = group % 3
            else
                val = 10 - group
            end
            if min_val.nil? || val < min_val
                min_val = val
                argmin = idx
            end
        end
        groups[argmin] -= 1 if argmin
    end
    
    num_required_group_replaces = groups.sum { |group| group / 3 }
    
    num_required_deletes + [num_required_type_replaces, num_required_group_replaces, num_required_inserts].max
end
