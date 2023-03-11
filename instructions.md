## Prerequisites

If you plan to connect to your own private relay, you must first do the following:

1. Configure your Laptop/Desktop/Phone to use Tor. Instructions [here](https://docs.start9.com/latest/user-manual/connecting/connecting-tor/tor-os/)
2. If using Firefox (recommended), configure Firefox to use Tor. Instructions [here](https://docs.start9.com/latest/user-manual/connecting/connecting-tor/tor-firefox/)

## Using Iris

- Click `launch UI` to access your personal Iris website
- Create a new account or access an existing account by pasting in your private key. If creating a new account, be sure to securely back up the private key, preferably using Vaultwarden on your Start9 server
- To connect to your own private relay, go to Settings -> Nostr -> Relays and paste in your Nostr Relay Websocket URL (`e.g. ws://address.onion`). You can find this value in the Properties section of your Nostr RS Relay service

It is recommended to use your Relay's **Tor** websocket URL (`ws://address.onion`), since the LAN websocket URL (`wss://address.local`) will only work when you are home