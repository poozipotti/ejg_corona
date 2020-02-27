import { PrismaClient } from "@prisma/client";
import chalk from "chalk";
import faker from "faker";

const prisma = new PrismaClient();
const numUsers = 200;

async function main() {
  const users: any[] = [];
  for (let i = 0; i < numUsers; i++) {
    users.push(
      prisma.user.create({
        data: {
          id: Math.random().toString(),
          username: faker.internet.userName(),
          password: faker.internet.password(),
          email: faker.internet.email(),
        }
      })
    );
  }

  await Promise.all(users);
  const allUsers = await prisma.user.findMany();

  console.log(allUsers);
}

main()
  .catch(e => {
    console.log(chalk.magenta(`ERROR: ${e}`));
    throw e;
  })
  .finally(async () => {
    await prisma.disconnect;
  });
