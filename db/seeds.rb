Region.find_or_create_by! name: 'chicago'

Dataset.find_or_create_by!(
  name: 'LStationEntries',
  uid: 't2rn-p8d7',
  uri: 'https://data.cityofchicago.org/Transportation/CTA-Ridership-L-Station-Entries-Monthly-Day-Type-A/t2rn-p8d7'
)

Dataset.find_or_create_by!(
  name: 'StreetNames',
  uid: 'i6bp-fvbx',
  uri: 'https://data.cityofchicago.org/Transportation/Chicago-Street-Names/i6bp-fvbx'
)
