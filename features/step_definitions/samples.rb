

Given /^the sample users$/ do
  
  steps %{ 
    Given the following user records
      | first_name  | last_name | username | email                  | password |
      | Eddard      | Stark     | ned      | ned@stark.com          | secure!  |
      | Bran        | Stark     | bran     | bran@stark.com         | secure!  |
  }

end