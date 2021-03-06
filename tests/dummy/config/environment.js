/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    modulePrefix: 'dummy',
    environment: environment,
    baseURL: '/',
    locationType: 'auto',
    cookieKey: "_apiv4_key",
    host: "http://localhost:4000",
    namespace: "api",
    socketNamespace: "ws://localhost:4000/socket",
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      }
    },
    "ember-simple-auth": {
      authenticationRoute: "signin"
    },
    stripe: {
      key: "pk_test_9VNs5lmJpCba3wXgHTbjTcCh",
      publishableKey: "pk_test_9VNs5lmJpCba3wXgHTbjTcCh"
    },
    AutoX: {
      Components: {
        // showAttrField: "dummy-attr-field", 
        // showActionField: "dummy-action-field", 
        // showLinkField: "dummy-link-field",
        // indexSummarizeModel: "dummy-summarize-model",
        showModel: "dummy-model",
        indexCollection: "dummy-collection"
      }
    },

    APP: {
      // Here you can pass flags/options to your application instance
      // when it is created
    }
  };

  if (environment === 'development') {
    // ENV.APP.LOG_RESOLVER = true;
    // ENV.APP.LOG_ACTIVE_GENERATION = true;
    // ENV.APP.LOG_TRANSITIONS = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    // ENV.APP.LOG_VIEW_LOOKUPS = true;
  }

  if (environment === 'test') {
    // Testem prefers this...
    ENV.baseURL = '/';
    ENV.locationType = 'none';

    // keep test console output quieter
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;

    ENV.APP.rootElement = '#ember-testing';
  }

  if (environment === 'production') {

  }

  return ENV;
};
