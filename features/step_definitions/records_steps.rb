Given /^the following (.+) records?$/ do |factory, table|
  table.hashes.each do |hash|
    #Factory(factory, hash)
    factory.camelcase.constantize.create! hash
  end
end
