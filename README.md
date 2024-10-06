# PaperworkArchivePDFExportScript
Shell script to export the entire paperwork archive to an output folder and output the files here as a pdf and convert them to a pdf if necessary.

## Features

- **Converts PDF Documents**: The script looks for an existing `doc.pdf`, which, if found, will be copied to the output directory.
- **Image Conversion**: If no `doc.pdf` is present, the script searches the directory for edited (`.edited`) JPG files or unedited JPG files to convert them into a PDF file.
- **Filters Thumbnail Files**: The script ignores thumbnail files to ensure that only relevant information is converted.

## Prerequisites

- **ImageMagick**: Ensure that [ImageMagick](https://imagemagick.org/) is installed, as the script uses the `convert` function from ImageMagick to convert images to PDF.
- **Bash**: The script is built on Bash commands and should be run on typical Unix-based operating systems such as Linux and macOS.

## Usage

1. **Configure the Script**: 
   Edit the script to set the `input_dir` and `output_dir` variables to your desired directories.

   ```bash
   input_dir="path/to/your/input_directory"  # Example: /home/user/documents/paperwork
   output_dir="path/to/your/output_directory"  # Example: /home/user/documents/archive
2. **Run the script in terminal**
   Open your terminal and run the script.

   ```bash
   bash paperwork_archive_manager.sh
