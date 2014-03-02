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

    grunt serve --startMongo

This will start the app development version and mongod. --startMongo option spawns mongo before starting the app.
In this mode all files are watched. This means tests will run if a file that is part of the testsuite is changed.

# Running the prod version locally

To run the production version of the app do:

    grunt serve --target=dist --startMongo

This will start mongo then build and start the app.

# Building

The default task is to perform the build. So:

    grunt

Will run all tests, and build the app to the 'dist' folder. 
Once this is done, proceed with deployment to heroku.

# Deploying to heroku

TODO doc

# Other grunt tasks worth mentioning

### reinstall

  this task will clean bower and node_modules and run bower install and npm install. This will effectively ensure everything is as it is defined to be in package.json and bower.json
