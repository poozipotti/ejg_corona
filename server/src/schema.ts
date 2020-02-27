import { nexusPrismaPlugin } from "nexus-prisma";
import { makeSchema, objectType } from "@nexus/schema";

const User = objectType({
  name: "User",
  definition(t) {
    t.model.id();
    t.model.username();
    t.model.password();
    t.model.email();
  }
});

const Query = objectType({
  name: "Query",
  definition(t) {
    t.crud.user();
    t.crud.users();
  }
});

export const schema = makeSchema({
  types: [User, Query],
  plugins: [nexusPrismaPlugin()],
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
