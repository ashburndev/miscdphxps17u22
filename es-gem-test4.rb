gem 'elasticsearch', '=8.2.2'
require 'elasticsearch'

# export ELASTIC_USERNAME = "elastic"
# export ELASTIC_PASSWORD = "fn8*-BZRBp6Ztt0Rj+Rr"
# export ELASTIC_CERT_DIR = "/home/davidho/Downloads/elastic/elasticsearch-8.2.2/config/certs"
# export ELASTIC_CERT_FINGERPRINT = "ae6641a394209d0ac88b0b9ec4fb67225d36bafa6dd62b6dc88c9c6a39155f7c"

# ELASTIC_USERNAME = "elastic"
# ELASTIC_PASSWORD = "fn8*-BZRBp6Ztt0Rj+Rr"
# ELASTIC_CERT_DIR = "/home/davidho/Downloads/elastic/elasticsearch-8.2.2/config/certs"
# ELASTIC_CERT_FINGERPRINT = "ae6641a394209d0ac88b0b9ec4fb67225d36bafa6dd62b6dc88c9c6a39155f7c"

elastic_host = "localhost"
elastic_port = "443"
elastic_username = "elastic"
elastic_password = "fn8*-BZRBp6Ztt0Rj+Rr"
elastic_cert_dir = "/home/davidho/Downloads/elastic/elasticsearch-8.2.2/config/certs"
elastic_cert_fingerprint = "ae6641a394209d0ac88b0b9ec4fb67225d36bafa6dd62b6dc88c9c6a39155f7c"

host_string = "https://#{elastic_host}:#{elastic_password}@#{elastic_host}:#{elastic_port}"
puts host_string 

# client = Elasticsearch::Client.new log: true

client = Elasticsearch::Client.new(                              \
  host: "https://elastic:#{elastic_password}@localhost:9200",    \
  transport_options: { ssl: { verify: false } },                 \
  ca_fingerprint: elastic_cert_fingerprint
)

client.cluster.health

client.index(index: 'my-index', id: 1, body: { title: 'Test' })

client.indices.refresh(index: 'my-index')

client.search(index: 'my-index', body: { query: { match: { title: 'test' } } })

# In Kibana (http://localhost:5601/app/dev_tools#/console) I can confirm the above code indexed a new document
# GET my-index/_doc/1

# {
#   "_index" : "my-index",
#   "_id" : "1",
#   "_version" : 1,
#   "_seq_no" : 0,
#   "_primary_term" : 1,
#   "found" : true,
#   "_source" : {
#     "title" : "Test"
#   }
# }

