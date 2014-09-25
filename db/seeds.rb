Region.find_or_create_by! name: 'chicago'

Dataset.find_or_create_by!(
  name: 'LStationEntries',
  uid: 't2rn-p8d7',
  uri: 'https://data.cityofchicago.org/Transportation/CTA-Ridership-L-Station-Entries-Monthly-Day-Type-A/t2rn-p8d7'
)
