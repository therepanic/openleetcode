# @param {String[]} names
# @return {String[]}
def get_folder_names(names)
    name_count = {}
    result = []

    names.each do |name|
        if !name_count.key?(name)
            result << name
            name_count[name] = 1
        else
            k = name_count[name]
            while name_count.key?("#{name}(#{k})")
                k += 1
            end
            new_name = "#{name}(#{k})"
            result << new_name
            name_count[name] = k + 1
            name_count[new_name] = 1
        end
    end

    result
end
