#!/bin/bash

# Check if correct number of arguments provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <demo_number> <destination_directory>"
    exit 1
fi

DEMONUMBER=$(printf "%04d" $1)
DEMO_DIR_NAME="MASTG-DEMO-$DEMONUMBER"
DESTINATION=$2
DESTINATION="$DESTINATION/$DEMO_DIR_NAME"

# Clone the repository
echo "Cloning repository to $DESTINATION..."
git clone https://github.com/RobinNunkesser/dart-flutter-mas-test-app "$DESTINATION"

if [ $? -ne 0 ]; then
    echo "Error: Failed to clone repository"
    exit 1
fi

# Search for the demo directory
DEMO_DIR=$(find . -type d -name "$DEMO_DIR_NAME" | head -n 1)

if [ -z "$DEMO_DIR" ]; then
    echo "Error: Directory $DEMO_DIR_NAME not found"
    exit 1
fi

echo "Found demo directory: $DEMO_DIR"

# Copy mastg_test.dart if it exists
if [ -f "$DEMO_DIR/mastg_test.dart" ]; then
    echo "Copying mastg_test.dart..."
    cp "$DEMO_DIR/mastg_test.dart" "$DESTINATION/mas_test_app/lib/"
else
    echo "Warning: mastg_test.dart not found in $DEMO_DIR"
fi

# Copy pubspec.yaml if it exists
if [ -f "$DEMO_DIR/pubspec.yaml" ]; then
    echo "Copying pubspec.yaml..."
    cp "$DEMO_DIR/pubspec.yaml" "$DESTINATION/mas_test_app/"
else
    echo "Warning: pubspec.yaml not found in $DEMO_DIR"
fi

echo "Done!"