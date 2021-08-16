print "Seeding..."

provider01 = Provider.create!(npi: "1234567890", enumeration_type: "NPI-1", first_name: "Shujaat", last_name: "Azim", address: "10301 Holly Hill Place", city: "Potomac", state: "MD", "postal_code": "20854", taxonomy: "Radiology")

print "Done!"