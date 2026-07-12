# @param {String} name
# @param {String} typed
# @return {Boolean}
def is_long_pressed_name(name, typed)
    i = 0
    j = 0
    
    while j < typed.length
        if i < name.length && name[i] == typed[j]
            i += 1
            j += 1
        elsif j > 0 && typed[j] == typed[j - 1]
            j += 1
        else
            return false
        end
    end
    
    return i == name.length
end
