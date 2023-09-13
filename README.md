# Web3 Lotto Demo

This repository contains a demo of a Web3-based lottery application. Users can participate in the lottery by following the simple instructions below.

## Prerequisites

Before running the application, make sure you have [Flutter](https://docs.flutter.dev/get-started/install) installed on your machine.

Check if flutter is available as environment variable before you continue.

```bash
flutter --version
```
Returns Flutter Version.

## Getting Started

1. Clone this repository to your local machine:

#### Fast build and run:

HTTPS:
```bash
git clone https://github.com/Celpear/web3Lotto.git && cd web3Lotto && yarn && yarn dev
```
SSH:
```bash
git clone git@github.com:Celpear/web3Lotto.git && cd web3Lotto && yarn && yarn dev
```

#### Or do it manually:

HTTPS:
```bash
git clone https://github.com/Celpear/web3Lotto.git
```
SSH:
```bash
git clone git@github.com:Celpear/web3Lotto.git
```

2. Navigate to the project directory:
```bash
cd web3Lotto
```
3. Install project dependencies using [Yarn](https://classic.yarnpkg.com/):
```bash
yarn
```
## Development
To use the dApp, you need to install and set up a [MetaMask](https://metamask.io/download/) wallet as a Chrome Extension and choose the Sepolia Ethereum Test Network.  

To start the development server and run the application locally, use the following command:
```bash
yarn dev
```
This will start a development server, and you can access the application in your web browser if you choose a web browser as target.

## Building

To build the project for production, you can use the following command:
```bash
yarn build
```
This will generate a production-ready build of the application.

## Cleaning

To clean the project and remove any generated build files, use the following command:
```bash
yarn clean_project
```
This will remove the build artifacts and clean the project directory.

## For comprehensibility

In the "js_scripts/" directory, you will find all the JavaScript files that end up as minified files in the web folder during the build process. Therefore, make changes only to these files, as the "web/contract_connector_min.js" file will be overwritten during the project build with the JavaScript files from the "js_scripts/" directory.

## Contributing

If you'd like to contribute to this project, please open an issue or create a pull request. We welcome your contributions!

## Important!

The application only works with MetaMask on the Sepolia Ethereum Test Network!

Be careful when you deploy it on the mainnet. I am not liable for any damage or financial loss!

Deploy "smart_contract/lotto.sol" via https://remix.ethereum.org/ and MetaMask.
