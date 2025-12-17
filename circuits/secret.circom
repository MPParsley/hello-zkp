pragma circom 2.0.0;

/*
 * Hello ZKP! - A simple Zero-Knowledge Proof circuit
 *
 * This circuit proves: "I know a secret number X such that X * X = Y"
 * without revealing X.
 *
 * - Private input: secret (the number you know)
 * - Public input: publicSquare (the square that everyone can see)
 */

template SecretSquare() {
    // Private input - the secret we want to prove knowledge of
    signal input secret;

    // Public input - the publicly known square
    signal input publicSquare;

    // Constraint: secret * secret must equal publicSquare
    signal secretSquared;
    secretSquared <== secret * secret;

    // Assert the constraint
    publicSquare === secretSquared;
}

component main {public [publicSquare]} = SecretSquare();
