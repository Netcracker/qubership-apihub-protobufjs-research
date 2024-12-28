#!/usr/bin/env node
/**
 * Copyright 2024-2025 NetCracker Technology Corporation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


const protobuf = require('protobufjs');
const path = require('path');

// Get the proto file path from the command line argument
const protoFilePath = process.argv[2];

if (!protoFilePath) {
    console.error('Please provide a .proto file path.');
    process.exit(1);
}

// Resolve the proto file's absolute path
const absoluteProtoPath = path.resolve(protoFilePath);

const root = new protobuf.Root();
const res = root.loadSync(absoluteProtoPath, { keepCase: true,  alternateCommentMode: true, preferTrailingComment: true });  
const json = res.toJSON({ keepComments: true });
console.log(JSON.stringify(json, null, 2));