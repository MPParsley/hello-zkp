# Hello ZKP! 🔐

A simple Zero-Knowledge Proof demo that runs in your browser.

## What is this?

This project demonstrates a basic Zero-Knowledge Proof (ZKP) using ZK-SNARKs. It proves:

> **"I know a secret number X such that X × X = Y"**
>
> Without revealing what X is!

## Live Demo

Visit the GitHub Pages deployment to try it out!

## How it works

1. **You enter a secret number** (e.g., `7`)
2. **The public sees only the square** (e.g., `49`)
3. **You generate a cryptographic proof** that you know the square root
4. **Anyone can verify** the proof is valid - but they never learn your secret!

## Technical Stack

- **[Circom](https://docs.circom.io/)** - Circuit compiler for ZK-SNARKs
- **[snarkjs](https://github.com/iden3/snarkjs)** - JavaScript library for ZK-SNARK proofs
- **Groth16** - The proving system used
- **GitHub Pages** - Hosting the demo

## The Circuit

```circom
template SecretSquare() {
    signal input secret;          // Private: your secret number
    signal input publicSquare;    // Public: the square everyone sees

    signal secretSquared;
    secretSquared <== secret * secret;

    publicSquare === secretSquared;  // Prove this constraint holds!
}
```

## Local Development

```bash
# Install dependencies
npm install

# Run setup (installs circom)
npm run setup

# Build circuit and generate keys
npm run build

# Serve locally
npm run serve
```

## Deployment

The project automatically deploys to GitHub Pages on push to `main`:

1. GitHub Actions compiles the Circom circuit
2. Generates proving and verification keys
3. Deploys to GitHub Pages

## Learn More

- [ZK-SNARKs Explained](https://z.cash/technology/zksnarks/)
- [Circom Documentation](https://docs.circom.io/)
- [snarkjs GitHub](https://github.com/iden3/snarkjs)

## License

MIT
