# @param {String[]} folder
# @return {String[]}
def remove_subfolders(folder)
    folder.sort!
    res = []
    folder.each do |f|
        if res.empty?
            res << f
        else
            prev = res[-1]
            if f.start_with?(prev) && f.length > prev.length && f[prev.length] == '/'
                next
            else
                res << f
            end
        end
    end
    res
end
