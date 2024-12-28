# qubership-apihub-protobufjs-research
## Goal
To determine if we could use [json descriptors](https://github.com/protobufjs/protobuf.js?tab=readme-ov-file#using-json-descriptors) of protobufjs as internal format for processing proto files in APIHUB.

Pay special attention to:
- comments handling
- back conversion (from json descriptors to `proto` files)

## Samples
Original samples are in the  `proto` folder.

Corresponding json descriptors are in the `json` folder.

Results of back conversion from json descriptors to `proto` files are in the `proto_from_json` folder.

## Process
To reproduce conversion from scratch:
- run `npm install` to install protobufjs-cli
- use `proto2json.sh <source_directory> <target_directory>` to convert `proto` files to json descriptors
- use `json2proto.sh <source_directory> <target_directory>` to convert json descriptors to `proto` files

Note that currently `pbjs` CLI tool does not support handling comments during conversion (although comments handling is supported by core library). Use `convert-with-comments.js` script to see how `proto` files with comments is converted (e.g. `07-comments` sample). The downside is that the script does not support dependencies handling- e.g. `google` packages (although it is supported by `pbjs` tool). So, in scope of prototypes it is either dependency handled correcty (using `pbjs` or comments handled correctly `convert-with-comments.js`).