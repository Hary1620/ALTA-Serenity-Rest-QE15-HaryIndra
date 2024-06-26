@tugas
Feature: Register new user API
  Scenario Outline: Register new user with valid json
    Given Register new user with valid json "<FileName>"
    When Send request post register user
    Then Status code should be 200
    And Response body should contain a valid ID and token
    And validate json schema "register_users_json_schema.json"

    Examples:
    |FileName|
    |register_user1.json|
    |register_user2.json|


    Scenario Outline: Register new user with invalid json
      Given Register new user with invalid json "<FileName>"
      When Send request post register user
      Then Status code should be 400
      And Response body should be "Note: Only defined users succeed registration"
      And validate json schema "register_invalidusers_json_schema.json"

      Examples:
      |FileName|
      |invalidRegister_user1.json|
      |invalidRegister_user2.json|

