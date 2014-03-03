                      ___           ___           ___           ___           ___     
          ___        /\__\         /\  \         /\  \         /\__\         /\  \    
         /\  \      /::|  |        \:\  \       /::\  \       /::|  |        \:\  \   
         \:\  \    /:|:|  |         \:\  \     /:/\:\  \     /:|:|  |         \:\  \  
         /::\__\  /:/|:|  |__       /::\  \   /::\~\:\  \   /:/|:|  |__       /::\  \ 
      __/:/\/__/ /:/ |:| /\__\     /:/\:\__\ /:/\:\ \:\__\ /:/ |:| /\__\     /:/\:\__\
     /\/:/  /    \/__|:|/:/  /    /:/  \/__/ \:\~\:\ \/__/ \/__|:|/:/  /    /:/  \/__/
     \::/__/         |:/:/  /    /:/  /       \:\ \:\__\       |:/:/  /    /:/  /     
      \:\__\         |::/  /     \/__/         \:\ \/__/       |::/  /     \/__/      
       \/__/         /:/  /                     \:\__\         /:/  /                 
                     \/__/                       \/__/         \/__/                                                      

http://intentapp.herokuapp.com/

# Developing

Start by running:

    grunt serve 

This will start the app development version and mongod. you can supply --no-mongo option to avoid starting mongo.

In this mode all files are watched. This means tests will run if a file that is part of the testsuite is changed.

# Running the prod version locally

To run the production version of the app do:

    grunt serve --target=dist

This will start mongo then build and start the app.
If you already have mongo running you can skip starting mongo by supplying the --no-mongo option.

# Building

The default task is to perform the build. So:

    grunt

Will run all tests, and build the app to the 'dist' folder. 
Once this is done, proceed with deployment to heroku.

# Deploying to heroku

There is a grunt task that will deploy to heroku. 

    grunt heroku

For this task to work you need to have set up the dist directory as a git repo with heroku as the remote:

    cd dist
    git init
    git remote add heroku git@heroku.com:intentapp.git
    git pull heroku master
    git branch -u heroku/master

# Other grunt tasks worth mentioning

### reinstall

  this task will clean bower and node_modules and run bower install and npm install. This will effectively ensure everything is as it is defined to be in package.json and bower.json
