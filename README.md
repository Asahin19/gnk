# GNK

Repository du projet GN en Kit (GNK)

Based on Grails 2.2.4

## How To

   <ol>
    <li>clone repository</li>
    <li>import project into your favorite IDE</li>
    <li>upgrade project</li>

    $ grails upgrade // choose yes (you are sure)
    
NB: If you change your JDK version, re-upgrade grails too.
  <li>install MySQL and create database gnkdb and user gnk (without password) [http://dev.mysql.com/downloads/mysql] (http://dev.mysql.com/downloads/mysql)</li>
    
    CREATE DATABASE gnkdb;
    CREATE USER 'gnk'@'localhost';
    GRANT ALL PRIVILEGES ON gnkdb.* TO 'gnk'@'localhost';
    FLUSH PRIVILEGES;
  <li>download schema and database data from [db](db) folder</li>
  <li>import it into your newly created database</li>
  
    $ mysql -u gnk gnkdb < dump20140122.sql
  <li>Thats'it :) run your project!</li>
  
    $ grails run-app
  <li>Navigate to [http://localhost:8090/gnk](http://localhost:8090/gnk)</li>

  <li>Launch unitTests:</li>
  
	$ grails test-app
or
  
	$ grails test-app *Class
or
  
	$ grails test-app MyTestClass

  <li>Launch Selenium Tests (IHM):</li>

	$ grails test-app CreateGnTests
   </lo>
    
