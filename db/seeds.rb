p1 = Person.create(first_name: 'Kelvin', last_name: 'Martin')
p2 = Person.create(first_name: 'Al',     last_name: 'Capone')
p3 = Person.create(first_name: 'John',   last_name: 'Dillinger')
p4 = Person.create(first_name: 'Jon',   last_name: 'Grover')

[
  {incident_type: 'Armed Robbery'},
  {incident_type: 'First Degree Murder'}
].each do |ch_hash|
  p1.criminal_histories.create(ch_hash)
end

[
  {incident_type: 'Income Tax Evasion'},
  {incident_type: 'Violation of the Volstead Act'}
].each do |ch_hash|
  p2.criminal_histories.create(ch_hash)
end

[
  {incident_type: 'Armed Robbery'},
  {incident_type: 'Manslaughter'},
  {incident_type: 'First Degree Murder'}
].each do |ch_hash|
  p3.criminal_histories.create(ch_hash)
end

[
  {incident_type: 'Being Way Too Fly'},
  {incident_type: 'Using AJAX Without a License'},
  {incident_type: 'Pollywog Fighting'}
].each do |ch_hash|
  p4.criminal_histories.create(ch_hash)
end

f1 = p1.fingerprints.create
f2_fbi = p2.fingerprints.create
f2_cpd = p2.fingerprints.create
f3 = p3.fingerprints.create
f4 = p4.fingerprints.create

f1.create_fingerprint_database(name: 'Criminal Fingerprints', owner: 'New York Police Department')
f2_fbi.create_fingerprint_database(name: 'Integrated Automated Fingerprint Identification System', owner: 'Federal Bureau of Investigations')
f2_cpd.create_fingerprint_database(name: 'Fingerprints of Criminals', owner: 'Chicago Police Department')
f3.create_fingerprint_database(name: 'Integrated Automated Fingerprint Identification System', owner: 'Federal Bureau of Investigations')
f4.create_fingerprint_database(name: 'Flatiron School', owner: 'Central Intelligence Agency')

# Make sure the fingerprints keep their database ID
f1.save
f2_fbi.save
f2_cpd.save
f3.save
f4.save
