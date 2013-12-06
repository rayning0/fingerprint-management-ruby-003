@kelvin_martin = Person.create(first_name: 'Kelvin', last_name: 'Martin', age: 23)
@al_capone = Person.create(first_name: 'Al',  last_name: 'Capone', age: 48)
@john_dillinger = Person.create(first_name: 'John',   last_name: 'Dillinger', age: 31)
@jon_grover = Person.create(first_name: 'Jon',   last_name: 'Grover', age: 28)

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
  @kelvin_martin.criminal_histories.create(incident_type: incident_type)
end

[
  IncidentType.where(name: 'Income Tax Evasion').first,
  IncidentType.where(name: 'Violation of the Volstead Act').first
].each do |incident_type|
  @al_capone.criminal_histories.create(incident_type: incident_type)
end

[
  IncidentType.where(name: 'Armed Robbery').first,
  IncidentType.where(name: 'Manslaughter').first,
  IncidentType.where(name: 'First Degree Murder').first
].each do |incident_type|
  @john_dillinger.criminal_histories.create(incident_type: incident_type)
end

[
  IncidentType.where(name: 'Being Way Too Fly').first,
  IncidentType.where(name: 'Using AJAX Without a License').first,
  IncidentType.where(name: 'Pollywog Fighting').first
].each do |incident_type|
  @jon_grover.criminal_histories.create(incident_type: incident_type)
end

f1 = @kelvin_martin.fingerprints.create(taken_at: DateTime.new(1983, 12, 15))
f2_fbi = @al_capone.fingerprints.create(taken_at: DateTime.new(1923, 3, 4))
f2_cpd = @al_capone.fingerprints.create(taken_at: DateTime.new(1922, 5, 16))
f3 = @john_dillinger.fingerprints.create(taken_at: DateTime.new(1930, 8, 23))
f4 = @jon_grover.fingerprints.create(taken_at: DateTime.new(1776, 7, 4))

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
