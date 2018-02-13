require 'nokogiri'
require 'fileutils'

xml = []
xml << '<?xml version="1.0"?>'
xml << '<DOC></DOC>'
xml_str = xml.reject(&:blank?).join

schema_path = Rails.root.join('public', '3rd_party', 'schema.xsd')
xsd = Nokogiri::XML::Schema(File.read(schema_path))
doc = Nokogiri.XML(xml_str);

if xsd.validate(doc).size > 0
  ap xsd.validate(doc).to_a if Rails.const_defined?('Console')
  raise "Xml in not valid against xsd schema"
end
