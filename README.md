**About**
Nearby Customers Search using Greater Circle Distance formula which returns a list of users sorted by user_id. 
The output of the app can be found in output.txt at the top-level folder.

**Setup & Installation**

Below are the steps to run the code on different environments:

All commands should be run from the root folder of the App

**Docker Environment**

Build Docker container
`docker build . -t nearby-customers-search`

Print list of nearby customers
`docker run nearby-customer-search`

Run Unit Tests
`docker run nearby-customer-search test`


**Ruby Environment**

Install RVM
**https://rvm.io/rvm/install**

Download Ruby 2.4.1
**rvm install ruby-2.4.1**

Install Bundle
**bundle install**

Print list of nearby customers
`ruby executor.rb`
With Dynamic arguments with the order as `Radius, Latitude and Longitude`
`ruby executor.rb 100 53.339428 -6.257664`

Run Unit Tests
`rspec`