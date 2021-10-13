# Thirdparty Simulator

Thirdparty Simulator is a chart that deploys DFSP and PISP simulators to 
test the [Third Party API](../thirdparty) 


## Components

- mojaloop-simulator - an example DFSP backend that uses a rules engine to demonstrate and test different scenarios. Required only for a DFSP (PISP doesn't need a mojaloop-simulator instance)
- sdk-scheme-adapter - async/sync interface adapter for easy integration with the Mojaloop FSPIOP API
- thirdparty-sdk - async/sync interface adapter for easy integration with the Mojaloop Third Party API
- redis - maintains state for sdk-scheme-adapter and thirdparty-sdk