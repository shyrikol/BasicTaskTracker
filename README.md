# Basic task tracker application
To use this app, u need to log in as a Developer or as a Manager. Developer can see only
 projects he participates. Manager can see all list of project
  and Developers who work on this project. Also he can search any Developer
   in system. Any project could have a list of tasks to do, and every task have additional 
   list of comments.
   
 # How to run
Here we using the following technologies:

 - Spring (MVC, Security, JPA)
 - MySQL
 - Hibernate
 - Maven
 - HTML/CSS/JS (Bootstrap)
 - Tomcat
 
 Note that in **database.properties** you should change following
 data:
 ```sh
jdbc.url=jdbc:mysql://localhost:3306/YOURDATABASENAME
jdbc.username=YOURDATABASEUSERNAME
jdbc.password=YOURDATABASEPASS
 ```
 to your database properties.
 
 Then connect to database and run MySQL sqript **database.sql**
 to create required tables and put some default data.

![alt tag](https://raw.githubusercontent.com/shyrikol/BasicTaskTracker/master/src/main/resources/screen1.png)
![alt tag](https://raw.githubusercontent.com/shyrikol/BasicTaskTracker/master/src/main/resources/screen2.png)