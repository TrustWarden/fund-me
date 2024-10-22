<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->

<a id="readme-top"></a>

<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

<h3 align="center">Fund Me</h3>

  <p align="center">
    This is a fund raising smart contract that people can fund with sending ETH to the contract by calling `fund` function and the only owner of the smart contract is able to withdraw from the contract and receive in its wallet address.
  </p>
</div>

<!-- TABLE OF CONTENTS -->
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#quickstart">Quickstart</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>

<!-- ABOUT THE PROJECT -->

## About The Project

This is a fund-raising smart contract, in which people can fund with sending ETH to the FundMe smart contract by calling `fund` function, and the only owner of the smart contract is able to withdraw from the contract and receive in its wallet address. This while the project will keep the funders list in a mapping and empty it after the withdrawal occur.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

List of things you need to use the software and how to install them.

- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

  - You'll know you did it right if you can run `git --version` and you see a response like `git version x.x.x`

- [Foundry](https://getfoundry.sh)
  - You'll know you did it right if you can run `forge --version` and you see a response like `forge 0.2.0 (816e00b 2023-03-16T00:05:26.396218Z)`

### Quickstart

- Clone the repo and install dependencies
  ```sh
  git clone https://github.com/TrustWarden/fund-me.git
  cd fund-me
  make
  ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->

## Usage

### Deploy to local network (anvil)

Run the anvil blockchain on a terminal window

```sh
anvil
```

Then enter this command on another terminal

```sh
forge script script/DeployFundMe.s.sol
```

### Testing

For testing doesn't need to be deployed

```sh
forge test
```

Only run a matching specific test function

```sh
forge test --mt <TEST_FUNCTION_NAME>
```

To fork a live network use this method

```sh
forge test --fork-url $SEPOLIA_RPC_URL
```

### Test coverage

```sh
forge coverage
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Deployment to a testnet or mainnet

1. Setup environment variables
   You'll want to set your `SEPOLIA_RPC_URL` and `PRIVATE_KEY` as environment variables. You can add them to a `.env` file.

- `PRIVATE_KEY`: The private key of your account (like from [MetaMask](https://metamask.io/)). NOTE: FOR DEVELOPMENT, PLEASE USE A KEY THAT DOESN'T HAVE ANY REAL FUNDS ASSOCIATED WITH IT.

  - [You can learn how to export it here.](https://metamask.zendesk.com/hc/en-us/articles/360015289632-How-to-Export-an-Account-Private-Key)

- `SEPOLIA_RPC_URL`: This is url of the sepolia testnet node you're working with. You can get setup with one for free from [Alchemy](https://alchemy.com/?a=673c802981)

Optionally, add your `ETHERSCAN_API_KEY` if you want to verify your contract on [Etherscan](https://etherscan.io).

2. Get testnet ETH
   Head over to [faucets.chain.link](https://faucets.chain.link) and get some testnet ETH. You should see the ETH show up in your metamask.

3. Deploy
   ```sh
   forge script script/DeployFundMe.s.sol --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY
   ```

## Scripts

After deploying to a testnet or local net, you can run the scripts.

Using cast deployed locally example:

### Fund

```sh
cast send <FUNDME_CONTRACT_ADDRESS> "fund()" --value 0.1ether --private-key <PRIVATE_KEY>
```

or

```sh
forge script script/Interactions.s.sol:FundFundMe --rpc-url sepolia  --private-key $PRIVATE_KEY  --broadcast
forge script script/Interactions.s.sol:WithdrawFundMe --rpc-url sepolia  --private-key $PRIVATE_KEY  --broadcast
```

### Withdraw

```sh
cast send <FUNDME_CONTRACT_ADDRESS> "withdraw()"  --private-key <PRIVATE_KEY>
```

### Estimate gas

You can estimate how much gas all functions separately cost by running:

```sh
forge snapshot
```

And you'll see an output file called `.gas-snapshot`

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->

## Contact

TrustWarden - trustwardenog@gmail.com

[![X][x-shield]][x-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

Project Link: [https://github.com/TrustWarden/fund-me](https://github.com/TrustWarden/fund-me)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/TrustWarden/fund-me.svg?style=for-the-badge
[contributors-url]: https://github.com/TrustWarden/fund-me/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/TrustWarden/fund-me.svg?style=for-the-badge
[forks-url]: https://github.com/TrustWarden/fund-me/network/members
[stars-shield]: https://img.shields.io/github/stars/TrustWarden/fund-me.svg?style=for-the-badge
[stars-url]: https://github.com/TrustWarden/fund-me/stargazers
[issues-shield]: https://img.shields.io/github/issues/TrustWarden/fund-me.svg?style=for-the-badge
[issues-url]: https://github.com/TrustWarden/fund-me/issues
[license-shield]: https://img.shields.io/github/license/TrustWarden/fund-me.svg?style=for-the-badge
[license-url]: https://github.com/TrustWarden/fund-me/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/emranmiri
[x-shield]: https://img.shields.io/badge/-x-black.svg?style=for-the-badge&logo=x&colorB=555
[x-url]: https://x.com/trustwarden
[product-screenshot]: images/screenshot.png
[Next.js]: https://img.shields.io/badge/next.js-000000?style=for-the-badge&logo=nextdotjs&logoColor=white
[Next-url]: https://nextjs.org/
[React.js]: https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB
[React-url]: https://reactjs.org/
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[JQuery.com]: https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white
[JQuery-url]: https://jquery.com
