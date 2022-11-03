
1.upto(25) do |i|
    file_name = i.to_s
    Dir.mkdir(file_name)
    Dir.chdir file_name
    File.open("#{file_name}.rb", "w") do |f|     
        f.write(
            "require_relative \"../../Structs/Matrix\"\nrequire_relative \"../../Structs/List\"\nrequire_relative \"../../Structs/Queue\"\nrequire_relative \"../../Structs/Stack\"\n"
            )   
    end
    File.new("input.txt", "a+")
    File.new("test.txt", "a+")
    Dir.chdir ".."
end
