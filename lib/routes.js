'use strict';

var api = require('./controllers/api'),
    index = require('./controllers/index'),
    users = require('./controllers/users'),
    session = require('./controllers/session'),
    intentApi = require('./controllers/intentApi');

var middleware = require('./middleware');
var passport = require('passport');

/**
 * Application routes
 */
module.exports = function(app) {

  // Server API Routes

  app.get('/api/users/:userId/intents', intentApi.list);
  app.post('/api/users/:userId/intents', intentApi.create);
  app.get('/api/users/:userId/intents/:intentId', intentApi.read);
  app.put('/api/users/:userId/intents/:intentId', intentApi.update);
  app.del('/api/users/:userId/intents/:intentId', intentApi.del);

  // login, logout, and currentuser
  app.get('/api/users/me', users.me);
  app.post('/api/session', session.login);
  app.del('/api/session', session.logout);
  
  // old stuff from generator

  app.get('/api/awesomeThings', api.awesomeThings);
  app.post('/api/xusers', users.create);
  app.put('/api/xusers', users.changePassword);
  app.get('/api/xusers/:id', users.show);


  // All undefined api routes should return a 404
  app.get('/api/*', function(req, res) {
    res.send(404);
  });

  // Redirect the user to Facebook for authentication.  When complete,
  // Facebook will redirect the user back to the application at /auth/facebook/callback
  app.get('/auth/facebook', passport.authenticate('facebook', { scope: 'email' }));

  // Facebook will redirect the user to this URL after approval.  Finish the
  // authentication process by attempting to obtain an access token.  If
  // access was granted, the user will be logged in.  Otherwise,
  // authentication has failed.
  app.get('/auth/facebook/callback',  passport.authenticate('facebook', { successRedirect: '/list', failureRedirect: '/login' }));

  // All other routes to use Angular routing in app/scripts/app.js
  app.get('/partials/*', index.partials);
  app.get('/*', middleware.setUserCookie, index.index);

};
