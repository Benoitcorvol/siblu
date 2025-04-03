#!/bin/bash

# Configuration
MAX_IMAGE_SIZE_KB=500
QUALITY=85
ASSETS_DIR="assets/images"
OPTIMIZATION_LOG="build/asset_optimization.log"

# Create directories if they don't exist
mkdir -p build
touch $OPTIMIZATION_LOG
echo "Asset optimization started at $(date)" > $OPTIMIZATION_LOG

# Function to optimize PNG images
optimize_png() {
    local file="$1"
    local size_kb=$(du -k "$file" | cut -f1)
    
    if [ $size_kb -gt $MAX_IMAGE_SIZE_KB ]; then
        echo "Optimizing $file ($size_kb KB)" >> $OPTIMIZATION_LOG
        
        # Create backup
        cp "$file" "${file}.backup"
        
        # Optimize with pngquant
        pngquant --force --quality=80-$QUALITY --output "$file" "$file"
        
        # Get new size
        local new_size_kb=$(du -k "$file" | cut -f1)
        echo "Reduced from ${size_kb}KB to ${new_size_kb}KB" >> $OPTIMIZATION_LOG
        
        # Verify the optimization didn't corrupt the image
        if ! identify "$file" &> /dev/null; then
            echo "Warning: Optimization may have corrupted $file, restoring backup" >> $OPTIMIZATION_LOG
            mv "${file}.backup" "$file"
        else
            rm "${file}.backup"
        fi
    fi
}

# Process all PNG files
find $ASSETS_DIR -name "*.png" -type f | while read file; do
    optimize_png "$file"
done

# Generate optimization report
echo -e "\nOptimization Report:" >> $OPTIMIZATION_LOG
echo "Total images processed: $(find $ASSETS_DIR -name "*.png" -type f | wc -l)" >> $OPTIMIZATION_LOG
echo "Total size before: $(du -sh $ASSETS_DIR | cut -f1)" >> $OPTIMIZATION_LOG
echo "Total size after: $(du -sh $ASSETS_DIR | cut -f1)" >> $OPTIMIZATION_LOG

exit 0