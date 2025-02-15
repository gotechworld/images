## Prepare Node.js container images needed for AWS/Azure K8s clusters

&nbsp;

`Node.js` is a software platform for scalable server-side and networking applications. `Node.js` applications are written in JavaScript and can be run within the Node.js runtime on Mac OS X, Windows, and Linux without changes.

`Node.js` applications are designed to maximize throughput and efficiency, using non-blocking I/O and asynchronous events. `Node.js` applications run single-threaded, although `Node.js` uses multiple threads for file and network events. `Node.js` is commonly used for real-time applications due to its asynchronous nature.

`Node.js` internally uses the Google V8 JavaScript engine to execute code; a large percentage of the basic modules are written in JavaScript. `Node.js` contains a built-in, asynchronous I/O library for file, socket, and HTTP communication. The HTTP and socket support allows `Node.js` to act as a web server without additional software such as Apache.

&nbsp;

![Node.js](https://learncode24h.com/wp-content/uploads/2021/08/docker-nodejs.jpg)

&nbsp;

The `node` images come in many flavors, each designed for a specific use case. All of the images contain pre-installed versions of `node`, `npm`, and `yarn`. For each supported architecture, the supported variants are different ([versions.json](https://github.com/nodejs/docker-node/blob/main/versions.json)).

Use `Dockerfile` in your __Node.js__ app project. It assumes that your app has a file named [package.json](https://docs.npmjs.com/cli/v8/configuring-npm/package-json) defining [start script](https://docs.npmjs.com/cli/v8/using-npm/scripts).

