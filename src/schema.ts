import { makeExecutableSchema } from '@graphql-tools/schema';
import { printSchema } from 'graphql';
import { TypeSource } from '@graphql-tools/utils';
import { readFile } from 'fs/promises';
import { Context } from './context';
import { resolvers } from './resolvers';

const buildSchema = async () => {
  const typeDef = await readFile('./schema.prisma', 'utf8');

  return makeExecutableSchema({
    resolvers,
    typeDefs: typeDef,
  });
};

export const schema = buildSchema();
