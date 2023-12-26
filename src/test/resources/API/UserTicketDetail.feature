Feature: As a user, I want to access the ticket details of a specified user through the API connection using their ID.

  Scenario Outline: Verify that when a GET request with valid authorization information and correct data (id)
  is sent to the 'user/ticket/detail/{{id}}' endpoint, the returned status code is 200, and the success
  information in the response body is "true"

    Given The API user sets "user/ticket/detail/<id>" path parameters
    And The API user saves the response from the user ticket detail endpoint with valid authorization information
    #Apı kulanıcısı user ticket detail endpointinden donen responseı geçerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    #Api kullanicisi status codeun 200 oldugunu dogrular
    And The API user verifies that the success attribute in the response body is true
    #Api kullanicisi response bodydeki success bilgisinin "true" oldugunu dogrular

    Examples:
      | id  |
      | 124 |


  Scenario: Verify that when a GET request with valid authorization information and lacking the 'id' is sent
  to the 'user/ticket/detail/{{id}}' endpoint, the returned status code is 203, and the message information
  in the response body is "No id"

    Given The API user sets "user/ticket/detail" path parameters
    And The API user saves the response from the user ticket detail endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    #Api kullanicisi status codeun 203 oldugunu dogrular
    And The API User verifies that the message information in the response body is "No id"
    #Api kullanicisi response bodydeki message bilgisinin "No id" oldugunu doğrular


  Scenario Outline: Verify that when a GET request with valid authorization information and containing an (id)
  that does not exist in the records is sent to the 'user/ticket/detail/{{id}}' endpoint, the returned status
  code is 203, and the message information in the response body is "No ticket."

    Given The API user sets "user/ticket/detail/<id>" path parameters
    And The API user saves the response from the user ticket detail endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    #Api kullanicisi status codeun 203 oldugunu dogrular
    And The API User verifies that the message information in the response body is "No ticket."
    #Api kullanicisi response bodydeki message bilgisinin "No ticket." oldugunu doğrular

    Examples:
      | id  |
      | 577 |


  Scenario Outline: Verify that when a GET request with invalid authorization information is sent to the
  'user/ticket/detail/{{id}}' endpoint, the returned status code is 401, and the error message in the
  response body is "Unauthorized request"

    Given The API user sets "user/ticket/detail/<id>" path parameters
    Then The API user records the response with invalid authorization information, verifies that the status code is '401' and confirms that the error information is Unauthorized
    #Api kullanicisi responsei geçersiz authorization bilgisi ile kaydeder, status codeun 401 ve error bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id  |
      | 124 |


  Scenario Outline: The contents of the data (id, user_id, name, email, ticket, subject, status, priority,
  last_reply, created_at, updated_at) within the response body should be verified

    Given The API user sets "user/ticket/detail/<id>" path parameters
    And The API user saves the response from the user ticket detail endpoint with valid authorization information
    Then The API user verifies that the content of the data field in the response body includes <id>, <user_id>, "<name>", "<email>", "<ticket>", "<subject>", <status>, <priority>, "<last_reply>", "<created_at>", "<updated_at>"
    #API kullanicisi response bodydeki data <id>, <user_id>, "<name>", "<email>", "<ticket>", "<subject>", <status>, <priority>, "<last_reply>", "<created_at>", "<updated_at>" içeriklerini doğrular

    Examples:
      | id  | user_id | name        | email                   | ticket | subject     | status | priority | last_reply          | created_at                  | updated_at                  |
      | 124 | 11      | Mehmet Genç | aliulvigirgin@gmail.com | 688230 | Test Ticket | 3      | 0        | 2023-12-26 03:17:00 | 2023-12-26T08:17:00.000000Z | 2023-12-26T08:17:19.000000Z |

