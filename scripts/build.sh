#!/bin/bash
set -e

echo "🔨 Building ZKP circuit..."

# Create build directory
mkdir -p build docs

# Compile the circuit
echo "📝 Compiling circuit..."
circom circuits/secret.circom --r1cs --wasm --sym -o build

# Download Powers of Tau (for small circuits, use a pre-generated one)
echo "⬇️ Downloading Powers of Tau ceremony file..."
if [ ! -f build/pot12_final.ptau ]; then
    curl -L "https://storage.googleapis.com/zkevm/ptau/powersOfTau28_hez_final_12.ptau" -o build/pot12_final.ptau
fi

# Generate zkey (proving key)
echo "🔑 Generating proving key..."
npx snarkjs groth16 setup build/secret.r1cs build/pot12_final.ptau build/secret_0000.zkey

# Add contribution to the ceremony (for production, this should be done properly)
echo "🎲 Adding contribution to ceremony..."
echo "hello-zkp-contribution" | npx snarkjs zkey contribute build/secret_0000.zkey build/secret_final.zkey --name="Hello ZKP" -v

# Export verification key
echo "📤 Exporting verification key..."
npx snarkjs zkey export verificationkey build/secret_final.zkey docs/verification_key.json

# Copy WASM to docs for browser use
echo "📦 Copying files to docs..."
cp build/secret_js/secret.wasm docs/
cp build/secret_final.zkey docs/

echo "✅ Build complete!"
echo ""
echo "Files generated in docs/:"
ls -la docs/
