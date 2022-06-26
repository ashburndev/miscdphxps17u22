# these are the tables for which no corresponding rails application model needs to be created
non_model_names = %w[ar_internal_metadata schema_migrations]
# non_model_names = %w[]
puts "non_model_names.class = #{non_model_names.class}"
puts "non_model_names = #{non_model_names}"
puts "non_model_names.length = #{non_model_names.length}"

# these are the tables for which I have already manually written a corresponding "rails generate model" command
skip_table_names = %w[
  attachments authors binaries carrier_wave_files comments digested_data
  document_authors document_countries document_non_state_actors
  document_topics documents export_chunks exports filedrop_ng_uploaded_files_binaries
  non_state_actors pdf_books users visual_media_types
]
# skip_table_names = []
skip_table_names.sort!
skip_table_names.each do |table_name| puts table_name end
puts "skip_table_names = #{skip_table_names}"
puts "skip_table_names.class = #{skip_table_names.class}"
puts "skip_table_names.length = #{skip_table_names.length}"

# the existing project has a mysql dump file named structure.sql
# these are the table names I obtained by using the command: grep 'CREATE TABLE' structure.sql
orig_table_names = %w[
  alerts 
  analysis_types
  ar_internal_metadata
  attachments
  authentication_failures
  authors 
  autolink_exclusions 
  base_values
  binaries
  carrier_wave_files
  classification_details
  comments 
  comment_subscriptions
  compartments
  concept_documents
  concepts
  control_orgs
  delayed_jobs
  digested_data
  document_components
  document_countries
  document_domestic_regions
  document_non_state_actors
  document_notifs
  document_revisions
  documents 
  document_authors
  document_topics
  document_views 
  document_regions 
  export_chunks
  exports 
  features 
  feedback 
  filedrop_ng_uploaded_files_binaries 
  filedrop_ng_uploaded_files 
  filings
  folders 
  guides
  images
  ingest_fixes
  leadership_details 
  legacy_searches
  lock_events 
  media_files
  merge_details
  navigations
  non_state_actors
  ntk_request_comments
  ntk_requests 
  oidc_users
  osint_users
  pdf_books
  permissions
  portlets
  producing_offices
  product_types
  recommended_feeds
  related_documents
  reporting_types
  restrictions
  roles 
  schema_migrations
  searches 
  selects 
  sessions 
  settings
  shares
  source_citations
  taggings
  tags 
  type_aheads
  users 
  visual_display_targets
  visual_media_types
  wires
]
# orig_table_names = %w[]

# includes ar_internal_metadata and schema_migrations
# table_names.length = 76
table_names_all = %w[
  alerts analysis_types ar_internal_metadata attachments authentication_failures 
  authors autolink_exclusions base_values binaries carrier_wave_files 
  classification_details comments comment_subscriptions compartments 
  concept_documents concepts control_orgs delayed_jobs digested_data 
  document_components document_countries document_domestic_regions 
  document_non_state_actors document_notifs document_revisions documents 
  document_authors document_topics document_views document_regions export_chunks 
  exports features feedback filedrop_ng_uploaded_files_binaries 
  filedrop_ng_uploaded_files filings folders guides images ingest_fixes 
  leadership_details legacy_searches lock_events media_files merge_details 
  navigations non_state_actors ntk_request_comments ntk_requests oidc_users 
  osint_users pdf_books permissions portlets producing_offices product_types 
  recommended_feeds related_documents reporting_types restrictions roles 
  schema_migrations searches selects sessions settings shares source_citations 
  taggings tags type_aheads users visual_display_targets visual_media_types wires 
]
# table_names_all = %w[]

# excludes ar_internal_metadata and schema_migrations
# table_names.length = 74
table_names = %w[
  alerts analysis_types attachments authentication_failures authors 
  autolink_exclusions base_values binaries carrier_wave_files 
  classification_details comments comment_subscriptions compartments 
  concept_documents concepts control_orgs delayed_jobs digested_data 
  document_components document_countries document_domestic_regions 
  document_non_state_actors document_notifs document_revisions documents 
  document_authors document_topics document_views document_regions export_chunks 
  exports features feedback filedrop_ng_uploaded_files_binaries 
  filedrop_ng_uploaded_files filings folders guides images ingest_fixes 
  leadership_details legacy_searches lock_events media_files merge_details 
  navigations non_state_actors ntk_request_comments ntk_requests oidc_users 
  osint_users pdf_books permissions portlets producing_offices product_types 
  recommended_feeds related_documents reporting_types restrictions roles searches 
  selects sessions settings shares source_citations taggings tags type_aheads 
  users visual_display_targets visual_media_types wires 
]
# table_names = %w[]

puts "*** complete ***"
puts table_names
puts "table_names.class = #{table_names.class}"
puts "table_names.length = #{table_names.length}"
line = ""
rails_gen_model_names = []
table_names.each do |table_name|
  # puts ">>>#{table_name}<<<  #{table_name.class}"
  # puts ">>>#{table_name}<<<"
  if (!non_model_names.include?(table_name))
    if ((line.length + table_name.length) > 80)
      puts line
      # puts line.length
      line = ""
    end
    line << "#{table_name} "
    if (!skip_table_names.include?(table_name))
      # table names are snake_case (all characters lower case)
      # model names are CamelCase (first character upper case)
      model_name = table_name.split('_').collect(&:capitalize).join
      if (model_name.end_with?("s"))   # document_countries ingest_fixes legacy_searches searches
        model_name = model_name[0..-2]
      end
      rails_gen_model_names << model_name
    end
  end
end
puts line
# puts line.length
# puts rails_gen_model_names
puts "rails_gen_model_names.class = #{rails_gen_model_names.class}"
puts "rails_gen_model_names.length = #{rails_gen_model_names.length}"
rails_gen_model_names.each do |model_name|
  puts "bin/rails generate model #{model_name}"
end
puts ENV["JAVA_HOME"]
# puts """  ENV["JAVA_HOME"] = #{ENV["JAVA_HOME"]} """
java_home = ENV["JAVA_HOME"]
puts """java_home = #{java_home}"""
puts "*** done ***"

# bin/rails generate model Alert
# bin/rails generate model AnalysisType
# bin/rails generate model AuthenticationFailure
# bin/rails generate model AutolinkExclusion
# bin/rails generate model BaseValue
# bin/rails generate model ClassificationDetail
# bin/rails generate model CommentSubscription
# bin/rails generate model Compartment
# bin/rails generate model ConceptDocument
# bin/rails generate model Concept
# bin/rails generate model ControlOrg
# bin/rails generate model DelayedJob
# bin/rails generate model DocumentComponent
# bin/rails generate model DocumentDomesticRegion
# bin/rails generate model DocumentNotif
# bin/rails generate model DocumentRevision
# bin/rails generate model DocumentView
# bin/rails generate model DocumentRegion
# bin/rails generate model Feature
# bin/rails generate model Feedback
# bin/rails generate model FiledropNgUploadedFile
# bin/rails generate model Filing
# bin/rails generate model Folder
# bin/rails generate model Guide
# bin/rails generate model Image
# bin/rails generate model IngestFix
# bin/rails generate model LeadershipDetail
# bin/rails generate model LegacySearch
# bin/rails generate model LockEvent
# bin/rails generate model MediaFile
# bin/rails generate model MergeDetail
# bin/rails generate model Navigation
# bin/rails generate model NtkRequestComment
# bin/rails generate model NtkRequest
# bin/rails generate model OidcUser
# bin/rails generate model OsintUser
# bin/rails generate model Permission
# bin/rails generate model Portlet
# bin/rails generate model ProducingOffice
# bin/rails generate model ProductType
# bin/rails generate model RecommendedFeed
# bin/rails generate model RelatedDocument
# bin/rails generate model ReportingType
# bin/rails generate model Restriction
# bin/rails generate model Role
# bin/rails generate model Search
# bin/rails generate model Select
# bin/rails generate model Session
# bin/rails generate model Setting
# bin/rails generate model Share
# bin/rails generate model SourceCitation
# bin/rails generate model Tagging
# bin/rails generate model Tag
# bin/rails generate model TypeAhead
# bin/rails generate model VisualDisplayTarget
# bin/rails generate model Wire

