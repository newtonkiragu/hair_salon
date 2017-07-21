# Hair Salon
This is an online website that dows the work of an online salon. The manager of the salon inputs the lists of stylists in her salon. The manager can then input the names and phonenumbers of the customers in her salon and assign them to a specific stylist. The manager has the optioni of updating or deleting the stylists and all their customers.

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites
You will need to have the latest version of `ruby` and `postgres` installed in your machine.
If you do not have ruby and you are running on a linux operating system, that can be easily arranged by pasting the code snippet below to your terminal

```
$ sudo apt-get update
$ sudo apt-get install ruby
```
If you are running on Mac or windows, here is a link with a detailed stepby step instruction on how to get ruby on your machine up and runing. [Mac](https://www.ruby-lang.org/en/documentation/installation/#homebrew) and [Windows](https://rubyinstaller.org/)

As of [postgres](https://www.postgresql.org/), You will need to have the latest version installed in your system. The following links will have the instructions [Windows](https://www.postgresql.org/download/windows/), [Mac](https://www.postgresql.org/download/macosx/), [Debian](https://www.postgresql.org/download/linux/debian/) and [Ubuntu](https://www.postgresql.org/download/linux/ubuntu/)

You will also nee to install the necessary gems in your system in the home directory
```
$ sudo gem install pg
```


### Installing
First, clone the repository from [GitHub](https://github.com/newtonkiragu/hair_salon) to your local machine or run the following code to your terminal

```
$ git clone https://github.com/newtonkiragu/hair_salon.git
```
Navigate into the file you have just cloned 
```
$ cd hair_salon
```
And then run```$ bundle``` so as to install the necessary gems into your system. Please note you might have to input your password.
Once the all the gems have finished installing, you can then create the database for your system using the following commands in your terminal

```
$ psql
$ CREATE DATABASE hair_salon;
$ \c hair_salon;
$ CREATE TABLE stylists(id serial PRIMARY KEY, name varchar, idnumber int, phonenunber int);
$ CREATE TABLE clients(id serial PRIMARY KEY, name varchar, phonenunber int, stylist_id int);
$ CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;
```
## Running the tests
To run tests for my app, run ```$ rspec``` in your terminal. If all is green, then the tests have successfully passed

## Deployment
To deploy my app, run the code below and then navigate to `localhost:4657` in your web browser
```
$ ruby app.rb
```

## Built With

* [Ruby](https://www.ruby-lang.org/en/) - The language used
* [Sinatra](http://www.sinatrarb.com/) - The DSL(Domain Specific Language) used
* [Materialize](http://materializecss.com/) - The styling


## Authors

* [**Newton Kriagu**](https://github.com/newtonkiragu)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Moringa
