#!/bin/bash

set -e

echo "🚀 Magento 2 Plugin for Lando Build Script"
echo "🔧 Checking prerequisites..."

case "${1:-}" in
  --build)
    rm -rf ./node_modules
    rm -rf ./package-lock.json
    npm cache clear --force
    npm install --verbose --omit=dev
    ;;
  --install-dev)
    lando plugin-add @lukutpg/lando-magento@file:${PWD}
    lando version --plugin @lukutpg/lando-magento
    ;;
  --install-prod)
    lando setup --plugin @lukutpg/lando-magento
    lando version --plugin @lukutpg/lando-magento
    ;;
  --uninstall)
    lando plugin-remove lando-magento
    ;;
  --pack)
    npm pack --dry-run
    ;;
  --publish)
    VERSION=$(node -p "require('./package.json').version")
    PACKAGE=$(node -p "require('./package.json').name")

    npm publish --access public --dry-run
    npm publish --access public
    npm dist-tag add "$PACKAGE@$VERSION" edge

    echo "::notice title=Published $VERSION to $PACKAGE::This is a stable release published to the default 'latest' npm tag"
    echo "::notice title=Updated latest tag to $VERSION::The stable tag now points to $VERSION"
    echo "::notice title=Updated edge tag to $VERSION::The edge tag now points to $VERSION"
    ;;
  *)
    echo "❌ Use: $0 --build | --install-dev | --install-prod | --uninstall | --pack | --publish"
    exit 1
    ;;
esac
