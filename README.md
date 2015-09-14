=======
# sinatra_taco_service
Taco Service for Team Tacos


### Deps

* vagrant
* virtualbox


### Running the containers

`
vagrant up
`

* I have not figured out how to get this to run from vagrant, but for migrations

` vagrant ssh `

` docker-compose -f /vagrant/docker-compose.yml run service rake db:migrate `
