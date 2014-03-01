'use strict';

var api = require('./controllers/api'),
    index = require('./controllers'),
    users = require('./controllers/users'),
    session = require('./controllers/session'),
    intentApi = require('./controllers/intentApi');

var middleware = require('./middleware');

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

  // old stuff from generator

  app.get('/api/awesomeThings', api.awesomeThings);

  app.post('/api/xusers', users.create);
  app.put('/api/xusers', users.changePassword);
  app.get('/api/xusers/me', users.me);
  app.get('/api/xusers/:id', users.show);

  app.post('/api/session', session.login);
  app.del('/api/session', session.logout);

  // All undefined api routes should return a 404
  app.get('/api/*', function(req, res) {
    res.send(404);
  });

  // All other routes to use Angular routing in app/scripts/app.js
  app.get('/views/*', index.partials);
  app.get('/*', middleware.setUserCookie, index.index);
};
