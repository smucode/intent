var expect = require('chai').expect, 
      intentApi = require('./../../../lib/controllers/intentApi');
describe('intentApi', function(){
  it('should exist', function(){
      expect(intentApi).to.exist;
  })
  describe('#create', function(){
    it('should exist', function(){
      expect(intentApi.create).to.exist;  
    })
  })
})