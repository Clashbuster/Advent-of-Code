2018.upto(2020) do |y|
    year = y.to_s
    Dir.mkdir(year)
    Dir.chdir year

    1.upto(25) do |i|
        file_name = i.to_s
        Dir.mkdir(file_name)
        Dir.chdir file_name
        File.open("#{file_name}.rb", "w") do |f|     
            f.write(
                "require_relative \"../../Structs/Matrix\"\nrequire_relative \"../../Structs/List\"\nrequire_relative \"../../Structs/Queue\"\nrequire_relative \"../../Structs/Stack\"\nFile.open(\"input.txt\").read"
                )   
        end
        File.new("input.txt", "a+")
        File.new("test.txt", "a+")
        Dir.chdir ".."
    end
    Dir.chdir ".."

end