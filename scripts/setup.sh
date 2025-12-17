#!/bin/bash
set -e

echo "📦 Setting up ZKP Hello World..."

# Check if circom is installed
if ! command -v circom &> /dev/null; then
    echo "⬇️ Installing Circom compiler..."

    # Download pre-built circom binary for Linux
    CIRCOM_VERSION="v2.1.6"
    curl -L "https://github.com/iden3/circom/releases/download/${CIRCOM_VERSION}/circom-linux-amd64" -o /tmp/circom
    chmod +x /tmp/circom
    sudo mv /tmp/circom /usr/local/bin/circom

    echo "✅ Circom installed"
else
    echo "✅ Circom already installed"
fi

# Install npm dependencies
echo "⬇️ Installing npm dependencies..."
npm install

echo "✅ Setup complete!"
