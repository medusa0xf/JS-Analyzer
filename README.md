# JS-Analyzer
This bash script analyzes javascripts files and find hidden endpoints

JS_Analyzer is a wrapper around relative-url-extractor so that it can be executed from anythwere in the terminal.

How It Works
Checks if the input file argument is provided. If not, it displays usage instructions and exits.
Sets the output file path to the provided second argument or defaults to output_results.txt.
Creates the output file.
Verifies the existence and executability of /usr/local/bin/extract.sh.
Processes each URL from the input file:
Extracts the JavaScript file name from the URL.
Fetches the JavaScript file using curl.
Passes the fetched content to /usr/local/bin/extract.sh.
Writes the JavaScript file name and extraction result to the output file.
Adds a separator between each file's results.
Informs the user that processing is complete and displays the output file path.
Notes
Ensure that /usr/local/bin/extract.sh is executable.
Modify the script as needed to fit your environment and requirements.
Troubleshooting
Permission Denied: Ensure you have write permissions for the specified output file path.
Script Not Found or Not Executable: Verify that /usr/local/bin/extract.sh exists and has execute permissions.
