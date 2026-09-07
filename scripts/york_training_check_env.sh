#!/usr/bin/env bash

echo "Checking environment..."
echo

echo "Git:"
git --version
echo

echo "Java:"
java --version
echo

echo "Maven:"
mvn -v
echo

echo "Node:"
node -v
echo

echo "npm:"
npm -v
echo

echo "Next:"
npx next --version
echo

echo "React:"
npx create-react-app --version
echo

echo "TypeScript compiler:"
tsc -v
echo

echo "Done!"
