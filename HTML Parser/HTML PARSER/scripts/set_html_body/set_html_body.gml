function set_html_body(body)
{
// Declare variables to store file content
var start_content, style_content, bodystart_content, end_content;
var final_content;

// Paths to the files (assuming they are in the included files or datafiles directory)
var start_file =			"data/start.html";
var style_file =			"data/style.css";
var bodystart_file =		"data/bodystart.html";
var end_file =				"data/end.html";

// Check if the files exist and read the content
if (file_exists(start_file)) {
    var file_start = file_text_open_read(start_file);
    start_content = "";
    while (!file_text_eof(file_start)) {
        start_content += file_text_read_string(file_start) + "\n"; // Preserve line breaks
        file_text_readln(file_start);
    }
    file_text_close(file_start);
} else {
    show_message("start.html not found.");
}

if (file_exists(style_file)) {
    var file_style = file_text_open_read(style_file);
    style_content = "";
    while (!file_text_eof(file_style)) {
        style_content += file_text_read_string(file_style) + "\n"; // Preserve line breaks
        file_text_readln(file_style);
    }
    file_text_close(file_style);
} else {
    show_message("style.css not found.");
}

if (file_exists(bodystart_file)) {
    var file_bodystart = file_text_open_read(bodystart_file);
    bodystart_content = "";
    while (!file_text_eof(file_bodystart)) {
        bodystart_content += file_text_read_string(file_bodystart) + "\n"; // Preserve line breaks
        file_text_readln(file_bodystart);
    }
    file_text_close(file_bodystart);
} else {
    show_message("bodystart.html not found.");
}


if (file_exists(end_file)) {
    var file_end = file_text_open_read(end_file);
    end_content = "";
    while (!file_text_eof(file_end)) {
        end_content += file_text_read_string(file_end) + "\n"; // Preserve line breaks
        file_text_readln(file_end);
    }
    file_text_close(file_end);
} else {
    show_message("end.html not found.");
}

// Combine the contents of the three files
final_content = start_content + style_content + bodystart_content + body + "\n" + end_content;

var output_file = "output.html";
var file_output = file_text_open_write(output_file); // Open the file for writing
file_text_write_string(file_output, final_content);  // Write the combined content
file_text_close(file_output);                        // Close the file after writing


}