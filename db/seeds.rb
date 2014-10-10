require 'csv'

def data_path file_name
  Rails.root.join("data").join(file_name).to_s
end

def get_csv file_name
  csv_text = File.read(data_path(file_name))
  csv = CSV.parse(csv_text, :headers => true)
end

def seed_lawyers
  get_csv("lawyers_city_list.csv").each do |row|
    Lawyer.create! code: row[0], name: row[1], years_of_experience: row[2], location: row[3], average_rating: row[4]
  end
end

def seed_services
  get_csv("lawyer_service_list.csv").each do |row|
    s = Service.find_or_create_by! code: row[1], name: row[2]
    l = Lawyer.find_by_code row[0]
    ServiceCharge.create! charge: row[3], lawyer: l, service: s
  end
end

seed_lawyers
seed_services