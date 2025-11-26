// -----------------------------------------------------------------------------
// Macro: Delete Multi-ROIs in Your Rectangle.ijm
// Author: Shangguan Pingchuan
// Email:  zxlearly@gmail.com
// Date:   2025-11-26
//
// Description:
// Draw an selection (only rectangle) and run the macro.
// All ROIs in the ROI Manager that overlap this selection will be deleted.
// No need to add the selection to the ROI Manager.
// Tested on ImageJ 1.54g
// -----------------------------------------------------------------------------

macro "Delete Multi-ROIs in Your Rectangle" {
    // 1. Ensure an active selection exists
    if (selectionType == -1)
        exit("Please draw a selection that encloses the ROIs you want to remove.");

    // 2. Save the current selection as an overlay for later restoration
    run("Add Selection...", "name=temp");

    // 3. Get the bounding box of the user-drawn selection
    getSelectionBounds(x0, y0, w0, h0);

    // 4. Loop through all ROIs in the ROI Manager (backwards to avoid index shifting)
    n = roiManager("count");
    if (n == 0) exit("ROI Manager is empty.");

    for (i = n - 1; i >= 0; i--) {
        roiManager("select", i);          // activate the i-th ROI
        getSelectionBounds(x1, y1, w1, h1); // get its bounding box

        // 5. Delete the ROI if the two rectangles overlap
        if (x0 < x1 + w1 && x0 + w0 > x1 && y0 < y1 + h1 && y0 + h0 > y1) {
            roiManager("delete");
        }
    }

    // 6. Restore the original selection and clean up the overlay
    run("Restore Selection", "overlay=temp");
    run("Remove Overlay");
    print("Done: overlapping ROIs have been deleted.");
    roiManager("Show All");   // refresh the overlay display
}
