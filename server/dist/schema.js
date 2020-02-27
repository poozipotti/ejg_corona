"use strict";
exports.__esModule = true;
var nexus_prisma_1 = require("nexus-prisma");
var schema_1 = require("@nexus/schema");
var User = schema_1.objectType({
    name: "User",
    definition: function (t) {
        t.model.id();
        t.model.username();
        t.model.password();
    }
});
var Query = schema_1.objectType({
    name: "Query",
    definition: function (t) {
        t.crud.user();
    }
});
exports.schema = schema_1.makeSchema({
    types: [User, Query],
    plugins: [nexus_prisma_1.nexusPrismaPlugin()],
    outputs: {
        schema: __dirname + "/../schema.graphql",
        typegen: __dirname + "/generated/nexus.ts"
    },
    typegenAutoConfig: {
        contextType: "Context.Context",
        sources: [
            {
                source: "@prisma/client",
                alias: "prisma"
            },
            {
                source: require.resolve("./context"),
                alias: "Context"
            }
        ]
    }
});
