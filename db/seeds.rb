p1 = Person.create(first_name: 'Kelvin', last_name: 'Martin')
p2 = Person.create(first_name: 'Al',     last_name: 'Capone')
p3 = Person.create(first_name: 'John',   last_name: 'Dillinger')
p4 = Person.create(first_name: 'Jon',   last_name: 'Grover')

[
  { name: 'Armed Robbery' },
  { name: 'First Degree Murder' },
  { name: 'Income Tax Evasion' },
  { name: 'Violation of the Volstead Act' },
  { name: 'Manslaughter' },
  { name: 'Being Way Too Fly' },
  { name: 'Using AJAX Without a License' },
  { name: 'Pollywog Fighting' }
].each do |it_hash|
  IncidentType.create(it_hash)
end

[
  IncidentType.where(name: 'Armed Robbery').first,
  IncidentType.where(name: 'First Degree Murder').first
].each do |incident_type|
  p1.criminal_histories.create(incident_type: incident_type)
end

[
  IncidentType.where(name: 'Income Tax Evasion').first,
  IncidentType.where(name: 'Violation of the Volstead Act').first
].each do |incident_type|
  p2.criminal_histories.create(incident_type: incident_type)
end

[
  IncidentType.where(name: 'Armed Robbery').first,
  IncidentType.where(name: 'Manslaughter').first,
  IncidentType.where(name: 'First Degree Murder').first
].each do |incident_type|
  p3.criminal_histories.create(incident_type: incident_type)
end

[
  IncidentType.where(name: 'Being Way Too Fly').first,
  IncidentType.where(name: 'Using AJAX Without a License').first,
  IncidentType.where(name: 'Pollywog Fighting').first
].each do |incident_type|
  p4.criminal_histories.create(incident_type: incident_type)
end

f1 = p1.fingerprints.create
f2_fbi = p2.fingerprints.create
f2_cpd = p2.fingerprints.create
f3 = p3.fingerprints.create
f4 = p4.fingerprints.create

f1.create_fingerprint_database(name: 'Criminal Fingerprints', owner: 'New York Police Department')
f2_fbi.create_fingerprint_database(name: 'Integrated Automated Fingerprint Identification System', owner: 'Federal Bureau of Investigation')

iafis = FingerprintDatabase.where(name: 'Integrated Automated Fingerprint Identification System').first

f2_cpd.create_fingerprint_database(name: 'Fingerprints of Criminals', owner: 'Chicago Police Department')
f3.fingerprint_database = iafis
f3.save
f4.create_fingerprint_database(name: 'Flatiron School', owner: 'Central Intelligence Agency')

# Fingerprints without people
iafis.fingerprints.create
f2_cpd.fingerprint_database.fingerprints.create

# Make sure the fingerprints keep their database ID
f1.save
f2_fbi.save
f2_cpd.save
f3.save
f4.save

fs1 = FingerprintScanner.create(location: 'Chicago')
fs2 = FingerprintScanner.create(location: 'Quantico')
fs3 = FingerprintScanner.create(location: 'New York')

fs1.fingerprints << f1
fs1.fingerprints << f2_cpd
fs2.fingerprints << f1
fs2.fingerprints << f2_fbi
fs3.fingerprints << f3
fs3.fingerprints << f4
