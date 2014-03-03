'use strict';

var mongoose = require('mongoose');

var IntentSchema = new mongoose.Schema({
  id:           { type: String },
  user:         { type: mongoose.Schema.Types.Mixed },
  type:         { type: String },
  activity:     { type: String },
  date:         { type: Date, default: Date.now },
  time:         { type: mongoose.Schema.Types.Mixed },
  messages:     { type: mongoose.Schema.Types.Mixed },
  participants: { type: mongoose.Schema.Types.Mixed }
});

module.exports = mongoose.model('Intent', IntentSchema);
