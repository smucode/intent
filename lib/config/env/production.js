'use strict';

module.exports = {
  env: 'production',
  mongo: {
    uri: process.env.MONGOLAB_URI ||
         process.env.MONGOHQ_URL ||
         'mongodb://localhost/fullstack'
  },
  fbCbUrl: "http://intentapp.herokuapp.com/auth/facebook/callback",
  fbAppId: '1464272590456231',
  fbAppSecret: '8e88c83aa523379c8e2489b65a4eb582'
};
