module.exports = {
  moduleNameMapper: {
    '^.+\\.(css|scss)$': 'identity-obj-proxy'
  },
  modulePaths: ['app/javascript/modules'],
  roots: ['app/javascript/__tests__/'],
  setupFiles: ['<rootDir>/app/javascript/__tests__/setup.js'],
  snapshotSerializers: [],
  testPathIgnorePatterns: ['app/javascript/__tests__/setup.js'],
  unmockedModulePathPatterns: [],
  testEnvironment: 'jsdom'
};
