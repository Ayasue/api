Feature: user should be able to create category
  Scenario: verify user successfully creates category
    Given base url "https://backend.cashwise.us/api/myaccount"
    And I have access
    And I have the endpoint "/categories"
    And I have "category_title" with "Foods" in request body
    And I have "category_description" with "Foods and drinks" in request body
    And I have "flag" with "true" in request body
    When I send POST request
    Then verify status code is 201

  Scenario Outline: verify flag accepts only boolean value
    Given base url "https://backend.cashwise.us/api/myaccount"
    And I have access
    And I have the endpoint "/categories"
    And I have "category_title" with "Foods" in request body
    And I have "category_description" with "Foods and drinks" in request body
    And I have "flag" with "<valueOfFlag>" in request body
    When I send POST request
    Then verify status code is 500
    Examples:
      | valueOfFlag |
      | FALSE       |
      | API true    |
      | UI false    |
      | 45678876543 |
      | 345678.3456 |


  @createCategory3
  Scenario: verify category title accepts 255 chars
    Given base url "https://backend.cashwise.us/api/myaccount"
    And I have access
    And I have the endpoint "/categories"
    And I have "category_title" with "About the job Roadie, a UPS Company, is a logistics management and crowdsourced delivery platform. Founded in 2014, Roadie offers businesses fast, flexible and asset-light logistics solutions for last-mile delivery. Roadie enables local delivery to more than 95% of U.S. households by providing access to more than 200,000 independent drivers nationwide – allowing businesses to offer their customers delivery optionality for almost any industry, from airlines to artisans Our innovative engineers are building technology that solves real-world problems in the crowdsourced delivery space. We are looking for a Senior QA Engineer to build test plans and maintain performance testing solutions that measure real-world workloads, ensuring the release of high quality code in a fast-paced CI/CD environment. The ideal candidate has deep technical experience, thrives in a fast-paced environment and wants to do more than write code" in request body
    And I have "category_description" with "Foods and Drinks" in request body
    And I have "flag" with "true" in request body
    When I send POST request
    Then verify status code is 500


