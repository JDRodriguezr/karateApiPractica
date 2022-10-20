Feature: Test Post requests
  
  Background: Setup base path again
  
  Given url 'https://reqres.in'

  Scenario: Create a new user by sending a post request with a name and a job 
    
   
    And path '/api/users'
    And request {"name": "julian","job": "qa_automator"}
    When method post
    Then status 201

  Scenario: Register a new email incorrectly by sending different data than expected
  
  And path '/api/register'
  And request {"name": "julian","job": "qa_automator"}
  When method post
  Then status 400
  
  Scenario: Register a new email correctly by sending email and password
  
	* def getRandomValue = function() {return Math.floor((12) * Math.random());}
  * def randomId = getRandomValue()
  And path '/api/users/' + randomId
  When method get  
  * def emailData = response.data.email
  * def body = {"email": "charles.morris@reqres.in","password": "contraseña"}
  #Preguntar como hacer para ingresar algun valor de una variable dentro del body de algun request
	And path '/api/register' 
	And request body
  When method post
  Then status 200
  
  Scenario: Login with a invalid user or email
    
  And path '/api/login'
  And request {"email": "julian@techmahindra.com","password": "123456"}
  When method post
  Then status 400
  
  Scenario: Login with a valid user or email 
    
  And path '/api/login'
  And request {"email": "eve.holt@reqres.in","password": "fictionalPassword132"}
  When method post
  Then status 200
  
