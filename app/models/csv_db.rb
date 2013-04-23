require 'csv'
class CsvDb
  class << self
    
    def convert_save(model_name, csv_data)
      csv_file = csv_data.read
      CSV.parse(csv_file) do |row|
        target_model = model_name.classify.constantize
        new_object = target_model.new

        column_iterator = -1
        target_model.column_names.each do |key|
          column_iterator += 1
          unless key == "ID"
            value = row[column_iterator]
            new_object.send "#{key}=", value
          end
        end
        new_object.save
      end
    end

    def import_invoices(csv_data, header)
      begin
        csv_file = csv_data.read
        count = 0
        CSV.parse(csv_file) do |row|

          unless header or row.empty?

            if row.length != 1
              raise "Row length is not vaild"
            end

            invoice = Invoice.new
            invoice.invoice_number = row[0]
            invoice.save
            count = count + 1
          end

          header = false
        end
        "#{count}-rows inserted successfully!"
      rescue
        "Something goes wrong with csv. (#{count}-rows inserted successfully!)"
      end
    end

    def import_shops(csv_data, header)
      begin    
        csv_file = csv_data.read
        count = 0
        CSV.parse(csv_file) do |row|

          unless header or row.empty?

            if row.length != 5
              raise "Row length is not vaild"
            end

            shop = Shop.new
            shop.name = row[0]
            shop.address = row[1]
            shop.logo = row[2]
            shop.password = row[3]
            shop.usama = row[4]
            shop.save
            count = count + 1
          end

          header = false
        end
        "#{count}-rows inserted successfully!"
      rescue
        "Something goes wrong with csv. (#{count}-rows inserted successfully!)"
      end        
    end

    def import_products(csv_data, header)
      begin
        csv_file = csv_data.read
        count = 0
        CSV.parse(csv_file) do |row|

          unless header or row.empty?

            if row.length != 2
              raise "Row length is not vaild"
            end

            product = Product.new
            product.bar_code = row[0]
            product.name = row[1]
            product.save
            count = count + 1
          end

          header = false
        end
        "#{count}-rows inserted successfully!"
      rescue
        "Something goes wrong with csv. (#{count}-rows inserted successfully!)"
      end

    end

  end
end