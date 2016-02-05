# Ultimate_Pet
Example of Ruby on Rails
This application provides user authentication (using the Devise gem), allowing logged in users to:

- Access list of the pets of the datastore.
- Add new pets .
- Edit and Deleting existing pets only if the user owns the pet.


Also using the gem Active Admin, (with user: admin@example.com and password : password ) you can admin the users previously created.

INSTALLATION

1. Clone this repository on your local machine.
2. Run bundle install to load all the required dependencies or gems.
3. Execute the rails server command to start the application on the http://localhost:3000 address.
4. Access the application address on your favorite web browser.


MODELS


User

The User model extends from the Devise gem User model. By default, it includes such attributes as email or password, among others. An additional attribute called name has been added. The authentication is handled by the Devise gem.

Pet

The Pet model represents the pet objects to be listed on the application. It has the following attributes:

name: The pet name given.
birthday: The birthday of the pet. The application will show the age which is calculated since that date.
category: the category to which the pet belongs. Available categories are: cat, dog, chinchilla.
sex: the sex of the pet. Available sex are: male, female.
user_id: an integer that identifies the User object that owns the pet.


Database

sqlite3 is used as the datastore for the application.
