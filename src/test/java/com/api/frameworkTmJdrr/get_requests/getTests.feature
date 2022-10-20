Feature: Test all the get requests listed on https://reqres.in
  
  Background: Setup base path
  Given url 'https://reqres.in'

  Scenario: Get a list of users from the path users 
    
    And path '/api/users'
    When method get
    Then status 200

  Scenario: Get a random id with successful response
  
  * def getRandomValue = function() {return Math.floor((12) * Math.random());}
  * def randomId = getRandomValue()
  And path '/api/users/' + randomId
  When method get
  Then status 200
  
  Scenario: Get a random id that should not be found
  
  * def getRandomValue = function() {return Math.floor(  ((100) * Math.random()) + 13 );}
  * def randomId = getRandomValue()
  And path '/api/users/' + randomId
  When method get
  Then status 404
  
  Scenario: Get a list of users from the path users 
    
    And path '/api/unknown'
    When method get
    Then status 200
  
  
  Scenario: Get a random single list from the unknown path
    
  * def getRandomValue = function() {return Math.floor((12) * Math.random());}
  * def randomId = getRandomValue()
  And path '/api/unknown/' 
  When method get
  Then status 200
  
  Scenario: Get a random object from the unknown list
  
  * def getRandomValue = function() {return Math.floor(  ((100) * Math.random()) + 13 );}
  * def randomId = getRandomValue()
  And path '/api/unknown/' + randomId
  When method get
  Then status 404
  
  