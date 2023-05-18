import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma.service';
import { Prisma } from '@prisma/client';

import { CreateBookDto } from './dto/create-book.dto';

@Injectable()
export class BooksService {
  constructor(private prisma: PrismaService) {}

  // async book(
  //   bookWhereUniqueInput: Prisma.BooksWhereUniqueInput,
  // ): Promise<Books | null> {
  //   return this.prisma.books.findUnique({
  //     where: bookWhereUniqueInput,
  //   });
  // }

  create(createBookDto: CreateBookDto) {
    return this.prisma.books.create({ data: createBookDto });
  }

  findAll() {
    return this.prisma.books.findMany();
  }

  findOne(bookWhereUniqueInput: Prisma.BooksWhereUniqueInput) {
    return this.prisma.books.findUnique({
      where: bookWhereUniqueInput,
    });
  }

  update(where: Prisma.BooksWhereUniqueInput, data: Prisma.BooksUpdateInput) {
    return this.prisma.books.update({ data, where });
  }

  remove(where: Prisma.BooksWhereUniqueInput) {
    return this.prisma.books.delete({ where });
  }
}
