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

# Rendering Template
By default Flask looks for templates in a templates subdirectory located inside the main 
application directory. 

# Bootstrap
Bootstrap is an open-source web browser framework from Twitter that provides 
user interface components that help create clean and attractive web pages that are compatible 
with all modern web browsers used on desktop and mobile platforms.


Bootstrap is a client-side framework, so the server is not directly involved with it. 
All the server needs to do is provide HTML responses that reference Bootstrap’s 
Cascading Style Sheets (CSS) and JavaScript files, and instantiate the desired 
user interface elements through HTML, CSS, and JavaScript code. The ideal place to do 
all this is in templates.


# Bootstrap Integration with Flask-Bootstrap
The naive approach to integrating Bootstrap with the application is to make all the 
necessary changes to the HTML templates, following the recommendations given by the 
Bootstrap documentation. But this is an area where the use of a Flask extension 
makes an integration task much simpler, while helping keep these changes nicely organized.
The extension is called Flask-Bootstrap.

pip install flask-bootstrap

note: 
If the application needs to add its own content to a block that already has some content, 
then Jinja2’s super() function must be used. 

# Links
To avoid direct links, Flask provides the url_for() helper function, which generates URLs 
from the information stored in the application’s URL map.


# Static Files
In its default configuration, Flask looks for static files in a subdirectory called static 
located in the application’s root folder. 

# Localization of Dates and Times with Flask-Moment
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






