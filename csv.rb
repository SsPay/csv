require 'csv'

new_file = File.open("new_file.csv", "w")

headers = ["Name/Date"]

temp_names = []
hours = []
dates = []

csv_hash = CSV.open("acme_worksheet.csv", headers: :first_row).map(&:to_h)
csv_hash.each do |hash|
  headers << hash["Date"]
  dates << hash["Date"]
  temp_names << [hash["Employee Name"]]
end

# names << temp_names.uniq

new_file << headers.uniq.to_csv

names = temp_names.uniq
dates.uniq!

csv_hash.each do |hash|
  names.each do |name|
  if name.include?(hash["Employee Name"])
    name.insert((dates.index(hash["Date"])+1),hash["Work Hours"])
  end
end
end


names.uniq.each do |name|
  new_file << name.to_csv
end
