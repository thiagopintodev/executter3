

Given /^the sample users$/ do
  
  steps %{ 
    Given the following user records
      | first_name  | last_name | username | email                  | password |
      | Eddard      | Stark     | ned      | ned@stark.com          | secure!  |
      | Bran        | Stark     | bran     | bran@stark.com         | secure!  |
      | Cerci       | Lannister | cerci    | cerci@lannister.com    | secure!  |
      | James       | Lannister | james    | james@lannister.com    | secure!  |
  }

end