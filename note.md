# Run Application
The ways to run app:
1. flask --app <app-name> run
2. export FLASK_APP=<app-name>; flask run

# Debug Mode
The ways to run debug mode:
1. flask --debug run
2. export FLASK_DEBUG=1; flask run

# Help
Useful command:
flask --help
flask <command> --help

# Context
To avoid cluttering view functions with lots of arguments that may not always be needed, 
Flask uses contexts to temporarily make certain objects globally accessible.

# URL Map
When the application receives a request from a client, it needs to find out what view 
function to invoke to service it. For this task, Flask looks up the URL given in the 
request in the application’s URL map, which contains a mapping of URLs to the view 
functions that handle them. Flask builds this map using the data provided in the 
app.route decorator, or the equivalent non-decorator version, app.add_url_rule().

# Request Hook
Sometimes it is useful to execute code before or after each request is processed. 
Flask gives you the option to register common functions to be invoked before or 
after a request is dispatched.

# Business Logic and Presentation Logic
A user who is registering a new account on a website. The user types an email address 
and a password in a web form and clicks the Submit button. On the server, a request 
with the data provided by the user arrives, and Flask dispatches it to the view function 
that handles registration requests. This view function needs to talk to the database 
to get the new user added, and then generate a response to send back to the browser 
that includes a success or failure message. These two types of tasks are formally 
called business logic and presentation logic, respectively.

# Template
A template is a file that contains the text of a response, with placeholder variables 
for the dynamic parts that will be known only in the context of a request. The process 
that replaces the variables with actual values and returns a final response string is 
called rendering. For the task of rendering templates, Flask uses a powerful template 
engine called Jinja2.

## Rendering Template
By default Flask looks for templates in a templates subdirectory located inside the main 
application directory. 

## Bootstrap
Bootstrap is an open-source web browser framework from Twitter that provides 
user interface components that help create clean and attractive web pages that are compatible 
with all modern web browsers used on desktop and mobile platforms.


Bootstrap is a client-side framework, so the server is not directly involved with it. 
All the server needs to do is provide HTML responses that reference Bootstrap’s 
Cascading Style Sheets (CSS) and JavaScript files, and instantiate the desired 
user interface elements through HTML, CSS, and JavaScript code. The ideal place to do 
all this is in templates.


## Bootstrap Integration with Flask-Bootstrap
The naive approach to integrating Bootstrap with the application is to make all the 
necessary changes to the HTML templates, following the recommendations given by the 
Bootstrap documentation. But this is an area where the use of a Flask extension 
makes an integration task much simpler, while helping keep these changes nicely organized.
The extension is called Flask-Bootstrap.

pip install flask-bootstrap

note: 
If the application needs to add its own content to a block that already has some content, 
then Jinja2’s super() function must be used. 

## Links
To avoid direct links, Flask provides the url_for() helper function, which generates URLs 
from the information stored in the application’s URL map.


## Static Files
In its default configuration, Flask looks for static files in a subdirectory called static 
located in the application’s root folder. 

## Localization of Dates and Times with Flask-Moment
There is an excellent open source library written in JavaScript that renders dates and times 
in the browser called Moment.js. Flask-Moment is an extension for Flask applications that 
makes the integration of Moment.js into Jinja2 templates very easy.

pip install flask-moment


# Web Forms
With HTML, it is possible to create web forms, in which users can enter information. 
The form data is then submitted by the web browser to the server, typically in the 
form of a POST request. The Flask request object exposes all the information sent by 
the client in a request and, in particular for POST requests containing form data, 
provides access to the user information through request.form.

Although the support provided in Flask’s request object is sufficient for the handling 
of web forms, there are a number of tasks that can become tedious and repetitive. 
Two good examples are the generation of HTML code for the forms and the validation of 
the submitted form data.

The Flask-WTF extension makes working with web forms a much more pleasant experience.
This extension is a Flask integration wrapper around the framework-agnostic WTForms package.

pip install flask-wtf


## Configuration
Unlike most other extensions, Flask-WTF does not need to be initialized at the 
application level, but it expects the application to have a secret key configured.

Flask-WTF requires a secret key to be configured in the application because this key 
is part of the mechanism the extension uses to protect all forms against 
cross-site request forgery (CSRF) attacks. 


## Redirects and User Sessions
When the last request sent is a POST request with form data, a refresh would cause 
a duplicate form submission, which in almost all cases is not the desired action. 
For that reason, the browser asks for confirmation from the user.

Many users do not understand this warning from the browser. Consequently, it is 
considered good practice for web applications to never leave a POST request as 
the last request sent by the browser.

This is achieved by responding to POST requests with a redirect instead of a 
normal response. A redirect is a special type of response that contains a URL 
instead of a string with HTML code. When the browser receives a redirect response, 
it issues a GET request for the redirect URL, and that is the page that it displays.

Applications can “remember” things from one request to the next by storing them in 
the user session, a private storage that is available to each connected client. 


# SQLAlchemy
SQLAlchemy is a powerful relational database framework that supports several database 
backends. It offers a high-level ORM and low-level access to the database’s native SQL 
functionality.

pip install flask-sqlalchemy

## Database Migrations with Flask-Migrate
Flask-SQLAlchemy creates database tables from models only when they do not exist already, 
so the only way to make it update tables is by destroying the old tables first—but of 
course, this causes all the data in the database to be lost.

A better solution is to use a database migration framework.

The developer of SQLAlchemy has written a migration framework called Alembic, but instead of 
using Alembic directly, Flask applications can use the Flask-Migrate extension, a lightweight 
Alembic wrapper that integrates it with the flask command.

## Creating a Migration Repository
To expose the database migration commands, Flask-Migrate adds a flask db command with several 
subcommands. When you work on a new project, you can add support for database migrations with 
the init subcommand:

flask db init

## Creating a Migration Script
Alembic migrations can be created manually or automatically using the revision and migrate 
commands, respectively. A manual migration creates a migration skeleton script with empty 
upgrade() and downgrade() functions that need to be implemented by the developer using 
directives exposed by Alembic’s Operations object. An automatic migration attempts to 
generate the code for the upgrade() and downgrade() functions by looking for differences 
between the model definitions and the current state of the database.

Automatic migrations are not always accurate and can miss some details that are ambiguous. 
For example, if a column is renamed, an automatically generated migration may show that 
the column in question was deleted and a new column was added with the new name. Leaving 
the migration as is will cause the data in this column to be lost! For this reason, 
migration scripts generated automatically should always be reviewed and manually corrected 
if they have any inaccuracies.


To make changes to your database schema with Flask-Migrate, the following procedure needs to be followed:
1. Make the necessary changes to the model classes.
2. Create an automatic migration script with the flask db migrate command.
3. Review the generated script and adjust it so that it accurately represents the changes that were made to the models.
4. Add the migration script to source control.
5. Apply the migration to the database with the flask db upgrade command.


# Email
Although the smtplib package from the Python standard library can be used to send email inside 
a Flask application, the Flask-Mail extension wraps smtplib and integrates it nicely with Flask.

pip install flask-mail



# Large Application Structure
## Using an Application Factory
The way the application is created in the single-file version is very convenient, but it has one big drawback.
Because the application is created in the global scope, there is no way to apply configuration changes 
dynamically: by the time the script is running, the application instance has already been created, 
so it is already too late to make configuration changes. This is particularly important for unit tests 
because sometimes it is necessary to run the application under different configuration settings for 
better test coverage.


The solution to this problem is to delay the creation of the application by moving it into a factory function 
that can be explicitly invoked from the script. This not only gives the script time to set the configuration, 
but also the ability to create multiple application instances — another thing that can be very useful during 
testing.


## Implementing Application Functionality in a Blueprint

The conversion to an application factory introduces a complication for routes. In single-script applications, the application instance exists in the global scope, so routes can be easily defined using the app.route decorator. But now that the application is created at runtime, the app.route decorator begins to exist only after create_app() is invoked, which is too late. Custom error page handlers present the same problem, as these are defined with the app.errorhandler decorator.

Luckily, Flask offers a better solution using blueprints. A blueprint is similar to an application in that it can also define routes and error handlers. The difference is that when these are defined in a blueprint they are in a dormant state until the blueprint is registered with an application, at which point they become part of it. 


## ALL
1. configuration (config.py)
2. application (app)
3. application script (flasky.py)
4. requirement file (requirement.txt)
5. unit test (tests)
6. database setup (flask db init; flask db upgrade)
7. run the application (flask run)


# User Authentication
There are many excellent Python authentication packages, but none of them do everything. 
The user authentication solution presented here uses several packages and provides the glue 
that makes them work well together. This is the list of packages that will be used, and what 
they’re used for:
- Flask-Login: Management of user sessions for logged-in users
- Werkzeug: Password hashing and verification
- itsdangerous: Cryptographically secure token generation and verification


## Password Security
The key to storing user passwords securely in a database relies on not storing the password itself 
but a hash of it. 

## Creating an Authentication Blueprint
The routes related to the user authentication subsystem will be added to a second blueprint, called auth. Using different blueprints for different subsystems of the application is a great way to keep the code neatly organized.


## User Authentication with Flask-Login
When users log in to the application, their authenticated state has to be recorded in the user session, 
so that it is remembered as they navigate through different pages. Flask-Login is a small but extremely 
useful extension that specializes in managing this particular aspect of a user authentication system, 
without being tied to a specific authentication mechanism.



# Gravatar
Gravatar associates avatar images with email addresses. Users create an account at https://gravatar.com 
and then upload their images. The service exposes the user’s avatar through a specially crafted URL 
that includes the MD5 hash of the user’s email address.

# Flask-PageDown
Flask-PageDown, a PageDown wrapper for Flask that integrates PageDown with Flask-WTF forms.
The Flask-PageDown extension defines a PageDownField class that has the same interface as 
the TextAreaField from WTForms. Before this field can be used, the extension needs to be initialized.

# Self-Referential Relationships
A relationship in which both sides belong to the same table is said to be self-referential.

# URI fragment
In computer hypertext, a URI fragment is a string of characters that refers to a resource that is subordinate to another, primary resource. The primary resource is identified by a Uniform Resource Identifier (URI), and the fragment identifier points to the subordinate resource.

The fragment identifier introduced by a hash mark # is the optional last part of a URL for a document. It is typically used to identify a portion of that document. The generic syntax is specified in RFC 3986. The hash-mark separator in URIs is not part of the fragment identifier.


# Application Programming Interfaces
In recent years, there has been a trend in web applications to move more and more of the business logic to the client side, producing an architecture that is known as Rich Internet Applications (RIAs). In RIAs, the server’s main (and sometimes only) function is to provide the client application with data retrieval and storage services. In this model, the server becomes a web service or application programming interface (API).

There are several protocols by which RIAs can communicate with a web service. Remote procedure call (RPC) protocols such as XML-RPC or its derivative, the Simplified Object Access Protocol (SOAP), were popular choices a few years ago. More recently, the Representational State Transfer (REST) architecture has emerged as the favorite for web applications due to its being built on the familiar model of the World Wide Web.

Flask is an ideal framework to build RESTful web services, thanks to its lightweight nature. 



## REST
the REST architectural style for web services in terms of its six defining characteristics:
- [Client–server] There must be a clear separation between clients and servers.
- [Stateless] A client request must contain all the information that is necessary to carry it out. The server must not store any state about the client that persists from one request to the next.
- [Cache] Responses from the server can be labeled as cacheable or noncacheable so that clients (or intermediaries between clients and servers) can use a cache for optimization purposes.
- [Uniform interface] The protocol by which clients access server resources must be consistent, well defined, and standardized. This is the most complex aspect of REST, covering the use of unique resource identifiers, resource representations, self-descriptive mes‐ sages between client and server, and hypermedia.
- [Layered system] Proxy servers, caches, or gateways can be inserted between clients and servers as necessary to improve performance, reliability, and scalability.
- [Code-on-demand] Clients can optionally download code from the server to execute in their context.

## Request and Response Bodies
Resources are sent back and forth between client and server in the bodies of requests and responses, but REST does not specify the format to use to encode resources. The Content-Type header in requests and responses is used to indicate the format in which a resource is encoded in the body. 

The two formats commonly used with RESTful web services are JavaScript Object Notation (JSON) and Extensible Markup Language (XML). For web-based RIAs, JSON is attractive due to being much more concise than XML, and because of its close ties to JavaScript, the client-side scripting language used by web browsers.





