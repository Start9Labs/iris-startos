<p align="center">
  <img src="icon.png" alt="Project Logo" width="21%">
</p>

# Iris for StartOS

[Iris](https://github.com/irislib/iris-messenger) is the Nostr app for a better social networks, offering secure, distraction-free, and data-controlled networking without the need for personal information. This repository creates the `s9pk` package that is installed to run `Iris` on [StartOS](https://github.com/Start9Labs/start-os/).

## Dependencies

Prior to building the `iris` package, it's essential to configure your build environment for StartOS services. You can find instructions on how to set up the appropriate build environment in the [Developer Docs](https://docs.start9.com/latest/developer-docs/packaging).

- [docker](https://docs.docker.com/get-docker)
- [docker-buildx](https://docs.docker.com/buildx/working-with-buildx/)
- [deno](https://deno.land/)
- [make](https://www.gnu.org/software/make/)
- [start-sdk](https://github.com/Start9Labs/start-os/tree/sdk/backend)
- [yq](https://mikefarah.gitbook.io/yq)

## Cloning

Clone the Iris package repository locally.

```
git clone https://github.com/Start9Labs/iris-startos.git
cd iris-startos
```

## Building

To build the **Iris** service as a universal package, run the following command:

```
make
```

Alternatively the package can be built for individual architectures by specifying the architecture as follows:

```
make x86
```

or

```
make arm
```

## Installing (on StartOS)

Before installation, define `host: https://server-name.local` in your `~/.embassy/config.yaml` config file then run the following commands to determine successful install:

> :information_source: Change server-name.local to your Start9 server address

```
start-cli auth login
#Enter your StartOS password
make install
```

**Tip:** You can also install the `iris.s9pk` by sideloading it under the **StartOS > System > Sideload a Service** section.

## Verify Install

Go to your StartOS Services page, select **Iris**, configure and start the service.

**Done!**
