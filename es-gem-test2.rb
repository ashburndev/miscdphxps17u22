require 'elasticsearch'
ELASTIC_USERNAME = "elastic"
ELASTIC_PASSWORD = "fn8*-BZRBp6Ztt0Rj+Rr"
CERT_DIR = "/home/davidho/Downloads/elastic/elasticsearch-8.2.2/config/certs"
CERT_FINGERPRINT = "ae6641a394209d0ac88b0b9ec4fb67225d36bafa6dd62b6dc88c9c6a39155f7c"

# client = Elasticsearch::Client.new log: true

client = Elasticsearch::Client.new(                              \
  host: "https://elastic:#{ELASTIC_PASSWORD}@localhost:9200",    \
  transport_options: { ssl: { verify: false } },                 \
  ca_fingerprint: CERT_FINGERPRINT
)

client.cluster.health

client.index(index: 'my-index', id: 1, body: { title: 'Test' })

client.indices.refresh(index: 'my-index')

client.search(index: 'my-index', body: { query: { match: { title: 'test' } } })
