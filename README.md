# `ecofund-icp`

EcoFund ICP is an innovative blockchain-based platform leveraging the power of the Internet Computer Protocol (ICP) to facilitate solidarity Donations for environmentally-focused projects. Our mission is to empower communities and individuals dedicated to sustainability by providing them with the financial resources.


Welcome to your new `ecofund-icp` project and to the Internet Computer development community. By default, creating a new project adds this README and some template files to your project directory. You can edit these template files to customize your project and to include your own code to speed up the development cycle.

To get started, you might want to explore the project directory structure and the default configuration file. Working with this project in your development environment will not affect any production deployment or identity tokens.

To learn more before you start working with `ecofund-icp`, see the following documentation available online:

- [Quick Start](https://internetcomputer.org/docs/current/developer-docs/setup/deploy-locally)
- [SDK Developer Tools](https://internetcomputer.org/docs/current/developer-docs/setup/install)
- [Motoko Programming Language Guide](https://internetcomputer.org/docs/current/motoko/main/motoko)
- [Motoko Language Quick Reference](https://internetcomputer.org/docs/current/motoko/main/language-manual)

If you want to start working on your project right away, you might want to try the following commands:

```bash
cd ecofund-icp/
dfx help
dfx canister --help
npm i -g ic-mops
mops --version
```

## Running the project locally

To test your project locally, you can use the following commands to streamline the setup and deployment process:

```bash
# Install dependencies and start a fresh replica in the background
npm install && dfx start --background --clean

# Deploy canisters to the local replica and generate the candid interface
dfx deploy

# (Optional) Clean node_modules and reinstall dependencies, followed by deployment
rm -rf node_modules && npm install && dfx deploy

# Stop the replica after testing
dfx stop
```

### Quick Setup & Deployment in One Step:

For a full setup and deployment in a single command:

```bash
rm -rf node_modules && npm install && dfx start --background --clean && dfx deploy
```

This will:

1. Remove existing `node_modules`.
2. Reinstall dependencies.
3. Start a fresh replica in the background.
4. Deploy the canisters.

To stop the replica:

```bash
dfx stop
```

Once the job completes, your application will be available at `http://localhost:4943?canisterId={asset_canister_id}`.

If you have made changes to your backend canister, you can generate a new candid interface with

```bash
npm run generate
```

at any time. This is recommended before starting the frontend development server, and will be run automatically any time you run `dfx deploy`.

If you are making frontend changes, you can start a development server with

```bash
npm start
```

## Setup ICP Ledger Canister

This guide will walk you through the process of setting up and configuring the ICP ledger canister for local development.

### 1. Deploy the Ledger Canister

Deploy the ICP ledger canister with initial configuration:

```bash
dfx deploy icp_ledger_canister --argument "(variant { Init = record { minting_account = \"$(dfx ledger --identity anonymous account-id)\"; initial_values = vec { record { \"$(dfx ledger --identity default account-id)\"; record { e8s = 10_000_000_000 : nat64; }; }; }; send_whitelist = vec {}; transfer_fee = opt record { e8s = 10_000 : nat64; }; token_symbol = opt \"LICP\"; token_name = opt \"Local ICP\"; } })"
```

### 2. Verify Ledger Health

Check that the ledger canister is working correctly by verifying the account balance:

```bash
dfx canister call icp_ledger_canister account_balance '(record {account = '$(python3 -c 'print("vec{" + ";".join([str(b) for b in bytes.fromhex("'$(dfx ledger --identity default account-id)'")]) + "}")')'})'
```

Expected output:

```bash
(record { e8s = 10_000_000_000 : nat64 })
```

### 3. Configure Canister Address

Before deploying the backend, set up the canister address variables:

```bash
# Get the canister account ID
TOKENS_TRANSFER_ACCOUNT_ID="$(dfx ledger account-id --of-canister ecofund-icp-backend)"

# Convert the account ID to byte format
TOKENS_TRANSFER_ACCOUNT_ID_BYTES="$(python3 -c 'print("vec{" + ";".join([str(b) for b in bytes.fromhex("'$TOKENS_TRANSFER_ACCOUNT_ID'")]) + "}")')"
```

### 4. Transfer Funds to Canister

Transfer ICP tokens to your canister:

```bash
dfx canister --identity default call icp_ledger_canister transfer "(record { to = ${TOKENS_TRANSFER_ACCOUNT_ID_BYTES}; memo = 1; amount = record { e8s = 2_00_000_000 }; fee = record { e8s = 10_000 }; })"
```

Successful output:

```bash
(variant { Ok = 1 : nat64 })
```

### 5. Test Canister Transfers

Verify that the canister can transfer funds by sending ICP back to the default account:

```bash
dfx canister call ecofund-icp-backend transfer "(record { amount = record { e8s = 100_000_000 }; toPrincipal = principal \"$(dfx identity --identity default get-principal)\" })"
```

### Notes

- The `e8s` value represents ICP tokens in e8s (1 ICP = 100_000_000 e8s)
- The transfer fee is set to 10_000 e8s
- Make sure you have sufficient funds in your default identity before making transfers
- The token symbol "LICP" stands for Local ICP, used for local development

Which will start a server at `http://localhost:8080`, proxying API requests to the replica at port 4943.

### Note on frontend environment variables

If you are hosting frontend code somewhere without using DFX, you may need to make one of the following adjustments to ensure your project does not fetch the root key in production:

- set`DFX_NETWORK` to `ic` if you are using Webpack
- use your own preferred method to replace `process.env.DFX_NETWORK` in the autogenerated declarations
  - Setting `canisters -> {asset_canister_id} -> declarations -> env_override to a string` in `dfx.json` will replace `process.env.DFX_NETWORK` with the string in the autogenerated declarations
- Write your own `createActor` constructor
-

## Documentation

https://docs.google.com/document/d/1x2GZHMm5a00O64oiaZ5DFpc3_Ooj6PC5985W3lLVd2Y/edit?usp=sharing

## Design (Mock-up)

This is a real front-end working , when you deploy this project in your computer you will notice this, here I have a video to show you how our design is working connected to the backend.

https://drive.google.com/file/d/1qwVE_gVcIYCnI4EJOMKDdQZyVnsHeq-j/view?usp=sharing
