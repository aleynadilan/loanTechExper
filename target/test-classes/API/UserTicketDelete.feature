Feature: As a user, I should be able to delete a user ticket record in the system through API connection.

  Scenario Outline: When a DELETE request with valid authorization information and correct 'id' is sent to the
  user/ticket/delete/{{id}} endpoint, the returned status code should be 200, and the message in the response
  body should be verified as "Ticket deleted"

    Given The API user sets "user/ticket/delete/<id>" path parameters
    And The API user saves the response from the user ticket delete endpoint with valid authorization information
    #Api kullanicisi user ticket delete endpointinden donen responsei gecerli authorization bilgisi ile kaydeder
    Then The API user verifies that the status code is 200
    And The API User verifies that the message information in the response body is "Ticket deleted"

    Examples:
      | id  |
      | 123 |


  Scenario: When a DELETE request with valid authorization information and no 'id' is sent to the
  user/ticket/delete/{{id}} endpoint, the returned status code should be 203, and the message in the
  response body should be verified as "No id"

    Given The API user sets "user/ticket/delete" path parameters
    And The API user saves the response from the user ticket delete endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No id"


  Scenario Outline: When a DELETE request with valid authorization information and a non-existent 'id' is sent
  to the user/ticket/delete/{{id}} endpoint, the returned status code should be 203, and the message in the
  response body should be verified as "No ticket."

    Given The API user sets "user/ticket/delete/<id>" path parameters
    And The API user saves the response from the user ticket delete endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No ticket."

    Examples:
      | id  |
      | 638 |


  Scenario Outline: Verify that when a DELETE request with invalid authorization information and the correct
  'id' is sent to the 'user/ticket/delete/{{id}}' endpoint, the returned status code is 401, and the error
  message in the response body is "Unauthorized request"

    Given The API user sets "user/ticket/delete/<id>" path parameters
    Then The API user saves the response from the user ticket delete endpoint with invalid authorization information and confirms that the status code is '401' and the error message is Unauthorized
    #Api kullanicisi user ticket delete endpointinden donen responsei geçersiz authorization bilgisi ile kaydeder, status codeun 401 ve error bilgisinin Unauthorized oldugunu dogrular

    Examples:
      | id  |
      | 123 |


  Scenario Outline: The deletion of the ticket record intended to be removed through the API should be verified.
  This can be confirmed by sending a GET request to the 'user/ticket/detail/{{id}}' endpoint with the Deleted
  ticket id returned in the response body, thus validating that the record has been deleted

    Given The API user sets "user/ticket/detail/<id>" path parameters
    And The API user saves the response from the user ticket detail endpoint with valid authorization information
    Then The API user verifies that the status code is 203
    And The API User verifies that the message information in the response body is "No ticket."

    Examples:
      | id  |
      | 123 |
