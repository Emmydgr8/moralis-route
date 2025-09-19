import { Clarinet, Tx, Chain, Account, types } from 'https://deno.land/x/clarinet@v1.0.4/index.ts';
import { assertEquals } from 'https://deno.land/std@0.90.0/testing/asserts.ts';

Clarinet.test({
    name: "Ensure route-tracker contract deployment",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const deployer = accounts.get('deployer')!;
        const block = chain.mineBlock([
            Tx.contractCall('route-tracker', 'check-deployment', [], deployer.address)
        ]);
        assertEquals(block.receipts.length, 1);
        block.receipts[0].result.expectOk().expectBool(true);
    }
});

Clarinet.test({
    name: "Asset registration workflow",
    async fn(chain: Chain, accounts: Map<string, Account>) {
        const wallet = accounts.get('wallet_1')!;
        const block = chain.mineBlock([
            Tx.contractCall('route-tracker', 'register-asset', [
                types.ascii('btc-001'),
                types.utf8('Bitcoin Primary'),
                types.ascii('Cryptocurrency'),
                types.uint(1635724800),
                types.uint(50000),
                types.uint(55000),
                types.none(),
                types.bool(false)
            ], wallet.address)
        ]);

        assertEquals(block.receipts.length, 1);
        block.receipts[0].result.expectOk().expectAscii('btc-001');
    }
});

// Additional test cases to be added covering various contract functions