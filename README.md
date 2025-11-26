# Delete Multi-ROIs in Your Rectangle

An ImageJ/Fiji macro that allows you to quickly delete multiple ROIs from the ROI Manager by simply drawing a selection rectangle around them.

## Overview

Tired of deleting ROIs one by one from a crowded ROI Manager? This macro streamlines your workflow. Just draw any selection (a rectangle) around the ROIs you wish to remove, run the macro, and all ROIs within the ROI Manager that overlap with your selection will be deleted in one go.

**Key Feature:** Your initial selection does not need to be added to the ROI Manager.

<img width="120" height="160" alt="image" src="https://github.com/user-attachments/assets/8cddcbe1-ab2e-41f4-9abc-56946c202016" />
<img width="120" height="160" alt="image" src="https://github.com/user-attachments/assets/258dc1ee-021e-4ffa-8073-ea3e44086278" />
<img width="120" height="160" alt="image" src="https://github.com/user-attachments/assets/050ffc33-bfa7-4309-b538-cb46d22327e4" />


## How It Works

1.  You draw a selection on your image.
2.  The macro saves this selection temporarily.
3.  It iterates through all ROIs in the ROI Manager (backwards to avoid index shifting).
4.  It checks for overlap between your drawn rectangle and each ROI's bounding box.
5.  All overlapping ROIs are deleted from the ROI Manager.
6.  Your original selection is restored and the temporary overlay is cleaned up.

## Installation

1.  **Open ImageJ/Fiji.**
2.  Navigate to `Plugins > Macros >Startup Macros...
3.  In the macro editor, paste the “entire” code from .ijm file to the end of Startup Macros file.
4.  Save the macro file to your ImageJ `macros` folder (e.g., `File > Save.` ).
5.  Restart ImageJ/Fiji.

The macro will now be available in your `Plugins > Macros` menu.

## Usage

1.  Open your image in ImageJ/Fiji.
2.  Populate the ROI Manager with several ROIs (e.g., by using `Analyze > Analyze Particles...`).
3.  From the toolbar, select the **Rectangle** tool.
4.  Draw a Rectangle on the image that encloses the ROIs you want to delete.
5.  Run the macro via `Plugins > Macros > Delete Multi-ROIs in Your Selection`.
6.  All ROIs in the ROI Manager that overlap with your drawn selection will be removed.


## Compatibility

- **Tested on:** ImageJ 1.54g
- **Should work on:** Most modern versions of ImageJ and Fiji.

## License

This project is released under the [MIT License](LICENSE).

## Contributing

Contributions, bug reports, and feature requests are welcome! Feel free to fork the repository and submit a Pull Request.

## Author

**Shangguan Pingchuan**

- Email: zxlearly@gmail.com

---
