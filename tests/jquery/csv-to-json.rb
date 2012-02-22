## Dont use class_eval within class_eval

require 'json'

module ImportFile
  def csv_import(filename)
    begin
      File.new(filename, 'r')
    rescue
      puts "\nNo such file"
      exit
    end
  end

  def json_export(filename, data)
    begin
      File.open(filename,"w") do |f|
        f.write(data.to_json)
      end
    rescue
      puts "\nNo such file"
      exit
    end
  end
end

class Product

  extend ImportFile

  def self.csv_to_json(csv_filename, json_filename)

    file = csv_import(csv_filename)

    hash_array = []

    file.each_line("\n") do |row|
      vals = row.chomp.split(/,/)
      hash_array << { name:vals[0], url:vals[1], color:vals[2], brand:vals[3], sold_out:vals[4] }
    end
    
    json_export(json_filename, hash_array)
  end

end

Product.csv_to_json("product_data/product_data.csv", "json/product_data.json")

