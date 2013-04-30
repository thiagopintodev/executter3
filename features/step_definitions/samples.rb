
Given /^James Pinto$/ do
  
  steps %{
    Given the following user records
      | first_name  | last_name | username    | email                 | password | gender | born_on    |
      | James       | Pinto     | jamespinto  | james@rubyfactory.net | secure!  | male   | 2000-01-01 |
  }

end

Given /^the sample users$/ do
  
  steps %{ 
    Given the following user records
      | first_name  | last_name | username | email                  | password | gender | born_on    |
      | Eddard      | Stark     | ned      | ned@stark.com          | secure!  | male   | 2000-01-01 |
      | Bran        | Stark     | bran     | bran@stark.com         | secure!  | male   | 2000-01-01 |
      | Cerci       | Lannister | cerci    | cerci@lannister.com    | secure!  | female | 2000-01-01 |
      | James       | Lannister | james    | james@lannister.com    | secure!  | male   | 2000-01-01 |
  }

end

Given /^the following (.+) records?$/ do |factory, table|
  table.hashes.each do |hash|
    #Factory(factory, hash)
    factory.camelcase.constantize.create! hash
  end
end
