-- CreateTable
CREATE TABLE "User" (
    "id" BIGSERIAL NOT NULL,
    "walletAddress" TEXT NOT NULL,
    "emailAddress" TEXT,
    "twitterUsername" TEXT,
    "discordUsername" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Bid" (
    "txHash" TEXT NOT NULL,
    "bidderId" BIGINT NOT NULL,
    "amount" DECIMAL(65,30) NOT NULL,
    "bidTime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Bid_pkey" PRIMARY KEY ("txHash")
);

-- CreateTable
CREATE TABLE "Settle" (
    "txHash" TEXT NOT NULL,
    "settlerId" BIGINT NOT NULL,
    "amount" DECIMAL(65,30) NOT NULL,
    "settleTime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Settle_pkey" PRIMARY KEY ("txHash")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_walletAddress_key" ON "User"("walletAddress");

-- CreateIndex
CREATE INDEX "User_walletAddress_idx" ON "User"("walletAddress");

-- AddForeignKey
ALTER TABLE "Bid" ADD CONSTRAINT "Bid_bidderId_fkey" FOREIGN KEY ("bidderId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Settle" ADD CONSTRAINT "Settle_settlerId_fkey" FOREIGN KEY ("settlerId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
